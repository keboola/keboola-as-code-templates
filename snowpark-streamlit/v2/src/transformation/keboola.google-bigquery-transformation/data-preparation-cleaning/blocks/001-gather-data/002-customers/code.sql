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
  `shipping_address__city`,
  `shipping_address__country`,
  O.`customer_id`
FROM `order` AS O
JOIN `last_order` AS LO
  ON LO.`id` = O.`id`;

/* BDM_CUSTOMERS */
CREATE OR REPLACE TABLE `bdm_customers` AS
SELECT
  C.`id` AS CUSTOMER_ID,
  SHA224(C.`email`) AS CUSTOMER_EMAIL_HASH,
  C.`email` AS CUSTOMER_EMAIL,
  C.`id` AS CUSTOMER_ACCOUNT_GUID,
  C.`default_address__city` AS CUSTOMER_BILLING_CITY,
  C.`default_address__country` AS CUSTOMER_BILLING_COUNTRY,
  LS.`shipping_address__city` AS CUSTOMER_SHIPPING_CITY,
  LS.`shipping_address__country` AS CUSTOMER_SHIPPING_COUNTRY,
  CAST('' AS STRING) AS CUSTOMER_PRICE_LIST,
  CAST('' AS STRING) AS CUSTOMER_GROUP,
  C.`accepts_marketing` AS ACCEPTS_MARKETING,
  C.`marketing_opt_in_level` AS MARKETING_OPT_IN_LEVEL,
  C.`orders_count` AS ORDERS_COUNT,
  C.`total_spent` AS TOTAL_SPEND,
  C.`verified_email` AS VERIFIED_EMAIL,
  C.`state` AS STATE
FROM `customer` AS C
LEFT JOIN `last_shipping_address` AS LS
  ON LS.`customer_id` = C.`id`;

/* - try to match customers based on email */
CREATE OR REPLACE TABLE `customer_ids` AS
SELECT DISTINCT
  O.`email`,
  C.CUSTOMER_ID
FROM `order` AS O
JOIN `bdm_customers` AS C
  ON O.`email` = C.CUSTOMER_EMAIL
QUALIFY
  ROW_NUMBER() OVER (PARTITION BY `email` ORDER BY C.CUSTOMER_ID NULLS LAST) = 1;

/* UPDATE ORDERS */
UPDATE `bdm_orders` AS O SET O.CUSTOMER_ID = C.CUSTOMER_ID
FROM `customer_ids` AS C
WHERE
  O.ORDER_CUSTOMER_EMAIL = C.`email`;

CREATE TABLE `order_customer_categories` AS
SELECT
  O.ORDER_ID,
  MIN(CAST(O.ORDER_DATE AS DATE)) OVER (PARTITION BY O.ORDER_CUSTOMER_EMAIL) AS FIRST_ORDER_DATE,
  MAX(CAST(O.ORDER_DATE AS DATE)) OVER (PARTITION BY O.ORDER_CUSTOMER_EMAIL) AS LAST_ORDER_DATE,
  DATE_DIFF(CAST(O.ORDER_DATE AS DATE), FIRST_ORDER_DATE, DAY) AS DAYS_SINCE_FIRST_ORDER,
  DATE_DIFF(
    O.ORDER_DATE,
    LAG(O.ORDER_DATE) OVER (PARTITION BY O.ORDER_CUSTOMER_EMAIL ORDER BY O.ORDER_DATE),
    DAY
  ) AS DIFF,
  CASE
    WHEN DIFF > 90
    THEN '110_Q+ since previous order'
    WHEN DIFF > 60
    THEN '100_2M-Q since previous order'
    WHEN DIFF > 30
    THEN '090_1M-2M since previous order'
    WHEN DIFF > 7
    THEN '080_7D-1M since previous order'
    WHEN DIFF > 6
    THEN '070_7D since previous order'
    WHEN DIFF > 5
    THEN '060_6D since previous order'
    WHEN DIFF > 4
    THEN '050_5D since previous order'
    WHEN DIFF > 3
    THEN '040_4D since previous order'
    WHEN DIFF > 2
    THEN '030_3D since previous order'
    WHEN DIFF > 1
    THEN '020_2D since previous order'
    WHEN DIFF > 0
    THEN '010_1D since previous order'
    ELSE 'N/A'
  END AS PREVIOUS_ORDER,
  (
    SELECT
      COUNT(1)
    FROM `bdm_orders` AS IO
    WHERE
      IO.ORDER_CUSTOMER_EMAIL = O.ORDER_CUSTOMER_EMAIL
  ) AS ORDER_COUNT,
  COUNT(*) OVER (PARTITION BY ORDER_CUSTOMER_EMAIL ORDER BY CAST(ORDER_DATE AS DATE) ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS ORDER_COUNT_ROLL,
  SUM(ORDER_TOTAL_PRICE_WITHOUT_TAXES) OVER (PARTITION BY ORDER_CUSTOMER_EMAIL ORDER BY CAST(ORDER_DATE AS DATE) ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS ORDER_PRICE_ROLL,
  CASE
    WHEN ORDER_COUNT_ROLL >= 14
    THEN '15+ total orders'
    WHEN ORDER_COUNT_ROLL > 9
    THEN '10-14 total orders'
    WHEN ORDER_COUNT_ROLL > 5
    THEN '6-9 total orders'
    WHEN ORDER_COUNT_ROLL > 3
    THEN '4-5 total orders'
    WHEN ORDER_COUNT_ROLL = 3
    THEN '3 total orders'
    WHEN ORDER_COUNT_ROLL = 2
    THEN '2 total orders'
    WHEN ORDER_COUNT_ROLL = 1
    THEN 'New Customer'
    ELSE 'new_customer'
  END AS CATEGORY_BY_ORDER_COUNT,
  ORDER_CUSTOMER_EMAIL,
  ORDER_TOTAL_PRICE_TAXES
FROM `bdm_orders` AS O
WHERE
  ORDER_CUSTOMER_EMAIL <> ''
ORDER BY
  ORDER_CUSTOMER_EMAIL NULLS LAST,
  ORDER_DATE NULLS LAST;

UPDATE `order_customer_categories` SET DIFF = 0
WHERE
  DIFF IS NULL;

/* - UPDATE CUSTOMER CATEGORIES AT THE TIME OF TRANSACTION */
UPDATE `bdm_orders` AS O SET O.CUSTOMER_REGULARITY_TYPE = C.CATEGORY_BY_ORDER_COUNT
FROM `order_customer_categories` AS C
WHERE
  O.ORDER_ID = C.ORDER_ID;

UPDATE `bdm_orders` AS O SET O.DAYS_SINCE_PREVIOUS_ORDER = C.DIFF
FROM `order_customer_categories` AS C
WHERE
  O.ORDER_ID = C.ORDER_ID;

UPDATE `bdm_orders` AS O SET O.IS_FIRST_PURCHASE = TRUE
FROM `order_customer_categories` AS C
WHERE
  O.ORDER_ID = C.ORDER_ID AND C.ORDER_COUNT_ROLL = 1;