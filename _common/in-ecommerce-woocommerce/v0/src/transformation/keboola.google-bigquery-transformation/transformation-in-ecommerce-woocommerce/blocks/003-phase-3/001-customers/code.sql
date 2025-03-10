
CREATE OR REPLACE TABLE `last_shipping_address` AS
WITH `last_order` AS (
  SELECT
    `customer_id`,
    MAX(`id`) AS `id`
  FROM `order`
  GROUP BY
    1
)
SELECT
  `shipping__city`,
  `shipping__country`,
  O.`customer_id`
FROM `order` AS O
JOIN `last_order` AS LO
  ON LO.`id` = O.`id`;

/* BDM_CUSTOMERS */
CREATE OR REPLACE TABLE `bdm_customers` (
  CUSTOMER_ID STRING NOT NULL,
  CUSTOMER_EMAIL_HASH STRING,
  CUSTOMER_EMAIL STRING,
  CUSTOMER_BILLING_CITY STRING,
  CUSTOMER_BILLING_COUNTRY STRING,
  CUSTOMER_SHIPPING_CITY STRING,
  CUSTOMER_SHIPPING_COUNTRY STRING,
  ORDERS_COUNT_TOTAL INT64,
  TOTAL_SPEND FLOAT64,
  AVG_ORDER_VALUE FLOAT64,
  RECENCY_SCORE STRING,
  DAYS_SINCE_LAST_ORDER INT64,
  FREQUENCY_SCORE STRING,
  ORDERS_COUNT_RFM INT64,
  MONETARY_SCORE STRING,
  SUM_REVENUE FLOAT64,
  FINAL_SCORE STRING,
  SEGMENT STRING,
  SEGMENT_NR INT64,
  FIRST_SUCCEEDED_TRANSACTION_DATE DATE,
  LAST_SUCCEEDED_TRANSACTION_DATE DATE
);

/* count orders_count a total_spend for each customer */
CREATE OR REPLACE TABLE `tmp_customer_order_count_value` AS
(
  SELECT
    `customer_id` AS CUSTOMER_ID,
    COUNT(DISTINCT `id`) AS ORDERS_COUNT,
    SUM(CAST(`total` AS FLOAT64)) AS TOTAL_SPEND
  FROM `order`
  GROUP BY
    1
);

CREATE OR REPLACE TABLE `tmp_customers` AS
(
  SELECT
    `id` AS CUSTOMER_ID,
    TO_HEX(SHA256(`email`)) AS CUSTOMER_EMAIL_HASH,
    `email` AS CUSTOMER_EMAIL,
    `billing__city` AS CUSTOMER_BILLING_CITY,
    `billing__country` AS CUSTOMER_BILLING_COUNTRY,
    LS.`shipping__city` AS CUSTOMER_SHIPPING_CITY,
    LS.`shipping__country` AS CUSTOMER_SHIPPING_COUNTRY,
    COALESCE(tmpco.ORDERS_COUNT, 0) AS ORDERS_COUNT_TOTAL,
    COALESCE(tmpco.TOTAL_SPEND, 0) AS TOTAL_SPEND,
    IF(
      tmpco.ORDERS_COUNT = 0 AND NOT tmpco.TOTAL_SPEND IS NULL,
      0,
      tmpco.TOTAL_SPEND / tmpco.ORDERS_COUNT
    ) AS AVG_ORDER_VALUE
  FROM `customer` AS C
  LEFT JOIN `tmp_customer_order_count_value` AS tmpco
    ON C.`id` = tmpco.`CUSTOMER_ID`
  LEFT JOIN `last_shipping_address` AS LS
    ON LS.`customer_id` = C.`id`
);

INSERT INTO `bdm_customers`
SELECT
  tmpc.CUSTOMER_ID,
  tmpc.CUSTOMER_EMAIL_HASH,
  tmpc.CUSTOMER_EMAIL,
  tmpc.CUSTOMER_BILLING_CITY,
  tmpc.CUSTOMER_BILLING_COUNTRY,
  tmpc.CUSTOMER_SHIPPING_CITY,
  tmpc.CUSTOMER_SHIPPING_COUNTRY,
  tmpc.ORDERS_COUNT_TOTAL,
  tmpc.TOTAL_SPEND,
  tmpc.AVG_ORDER_VALUE,
  CAST(R_SCORE AS STRING) AS RECENCY_SCORE,
  R_RAW AS DAYS_SINCE_LAST_ORDER,
  CAST(F_SCORE AS STRING) AS FREQUENCY_SCORE,
  F_RAW AS ORDERS_COUNT_RFM,
  CAST(M_SCORE AS STRING) AS MONETARY_SCORE,
  M_RAW AS SUM_REVENUE,
  FINAL_SCORE AS FINAL_SCORE,
  SEGMENT AS SEGMENT,
  SEGMENT_NR AS SEGMENT_NR,
  FIRST_SUCCEEDED_TRANSACTION_DATE AS FIRST_SUCCEDED_TRANSACTION_DATE,
  LAST_SUCCEEDED_TRANSACTION_DATE AS LAST_SUCCEDED_TRANSACTION_DATE
FROM `tmp_customers` AS tmpc
LEFT JOIN `rfm` AS rfm
  ON tmpc.CUSTOMER_ID = rfm.CUSTOMER_ID;

/* - try to match customers based on email */
CREATE OR REPLACE TABLE `customer_ids` AS
SELECT DISTINCT
  O.`billing__email` AS EMAIL,
  C.CUSTOMER_ID
FROM `order` AS O
JOIN `bdm_customers` AS C
  ON O.`billing__email` = C.CUSTOMER_EMAIL
QUALIFY
  ROW_NUMBER() OVER (PARTITION BY `billing__email` ORDER BY C.CUSTOMER_ID NULLS LAST) = 1;

/* UPDATE ORDERS */
UPDATE `bdm_orders` AS O SET O.CUSTOMER_ID = C.CUSTOMER_ID
FROM `customer_ids` AS C
WHERE
  O.ORDER_CUSTOMER_EMAIL = C.`EMAIL`;