/* BDM_ORDERS */
CREATE OR REPLACE TABLE `bdm_orders` (
  ORDER_ID STRING NOT NULL,
  ORDER_DATE DATE,
  ORDER_STATUS STRING,
  IS_SUCCESSFUL BOOL,
  IS_FIRST_PURCHASE BOOL,
  ORDER_CURRENCY STRING,
  ORDER_CUSTOMER_EMAIL STRING,
  ORDER_REMARK STRING,
  REFERER STRING,
  CHANNEL STRING,
  SOURCE STRING,
  BILLING_CITY STRING,
  BILLING_COUNTRY STRING,
  BILLING_ZIP STRING,
  SHIPPING_CITY STRING,
  SHIPPING_COUNTRY STRING,
  SHIPPING_ZIP STRING,
  BILLING_TYPE STRING,
  SHIPPING_TYPE STRING,
  ORDER_TOTAL_PRICE_WITH_TAXES FLOAT64,
  ORDER_TOTAL_PRICE_WITHOUT_TAXES FLOAT64,
  ORDER_TOTAL_PRICE_TAXES FLOAT64,
  CUSTOMER_ID STRING
);

INSERT INTO `bdm_orders`
SELECT DISTINCT
  O.`id` AS ORDER_ID,
  DATE(PARSE_TIMESTAMP('%a, %d %b %Y %H:%M:%S %z', O.`date_created`)) AS ORDER_DATE,
  O.`status` AS ORDER_STATUS,
  IF(O.`status` = 'Completed', TRUE, FALSE) AS IS_SUCCESSFUL,
  CASE WHEN DATE(PARSE_TIMESTAMP('%a, %d %b %Y %H:%M:%S %z', O.`date_created`)) = `min_order_date` THEN TRUE ELSE FALSE END AS IS_FIRST_PURCHASE,
  O.`currency_code` AS ORDER_CURRENCY,
  IF(O.`billing_address_email` = '', C.`email`, O.`billing_address_email`) AS ORDER_CUSTOMER_EMAIL,
  O.`customer_message` AS ORDER_REMARK,
  CAST('' AS STRING) AS REFERER,
  CAST('' AS STRING) AS CHANNEL,
  CAST('' AS STRING) AS SOURCE,
  O.`billing_address_city` AS BILLING_CITY,
  O.`billing_address_country` AS BILLING_COUNTRY,
  O.`billing_address_zip` AS BILLING_ZIP,
  CAST('' AS STRING) AS SHIPPING_CITY,
  CAST('' AS STRING) AS SHIPPING_COUNTRY,
  CAST('' AS STRING) AS SHIPPING_ZIP,
  O.`payment_method` AS BILLING_TYPE,
  CAST('' AS STRING) AS SHIPPING_TYPE,
  CAST(O.`total_inc_tax`AS FLOAT64) AS ORDER_TOTAL_PRICE_WITH_TAXES,
  CAST(O.`total_ex_tax` AS FLOAT64) AS ORDER_TOTAL_PRICE_WITHOUT_TAXES,
  CAST(O.`total_tax` AS FLOAT64) AS ORDER_TOTAL_PRICE_TAXES,
  O.`customer_id` AS CUSTOMER_ID
FROM `orders` AS O
LEFT JOIN `customers` AS C
  ON O.`customer_id` = C.`id`
LEFT JOIN (
  SELECT
    `customer_id`,
    MIN(DATE(PARSE_TIMESTAMP('%a, %d %b %Y %H:%M:%S %z', `date_created`))) AS `min_order_date`
  FROM `orders`
  GROUP BY
    `customer_id`
) AS m
  ON o.`customer_id` = m.`customer_id`;

/* BDM_ORDER_LINES */
CREATE OR REPLACE TABLE  `bdm_order_lines` (
  ORDER_ID STRING,
  ORDER_LINE_ID STRING NOT NULL,
  ORDER_DATE DATE,
  ORDER_LINE_PRODUCT_ID STRING,
  ITEMNAME STRING,
  DISCOUNT_PERCENT FLOAT64,
  ORDER_LINE_AMOUNT FLOAT64,
  ORDER_LINE_PRICE_WITH_TAXES FLOAT64,
  ORDER_LINE_PRICE_WITHOUT_TAXES FLOAT64,
  ORDER_LINE_PRICE_TAXES FLOAT64,
  ORDER_LINE_TAXES_RATE FLOAT64,
  LINE_PURCHASE_PRICE FLOAT64,
  AVG_ORDER_LINE_MARGIN FLOAT64
);

INSERT INTO `bdm_order_lines`
SELECT
  O.`id` AS ORDER_ID,
  OL.`id` AS ORDER_LINE_ID,
  DATE(PARSE_TIMESTAMP('%a, %d %b %Y %H:%M:%S %z', O.`date_created`)) AS ORDER_DATE,
  OL.`product_id` AS ORDER_LINE_PRODUCT_ID,
  OL.`name` AS ITEMNAME,
  (
    (
      CAST(OL.`total_inc_tax` AS FLOAT64) - CAST(OL.`discounted_total_inc_tax` AS FLOAT64)
    ) / CAST(OL.`total_inc_tax` AS FLOAT64)
  ) AS DISCOUNT_PERCENT,
  CASE WHEN OL.`quantity` = '' THEN 0 ELSE CAST(OL.`quantity` AS FLOAT64) END AS ORDER_LINE_AMOUNT,
  CASE WHEN OL.`total_inc_tax` = '' THEN 0 ELSE CAST(OL.`total_inc_tax` AS FLOAT64) END AS ORDER_LINE_PRICE_WITH_TAXES,
  CASE WHEN OL.`total_ex_tax` = '' THEN 0 ELSE CAST(OL.`total_ex_tax` AS FLOAT64) END AS ORDER_LINE_PRICE_WITHOUT_TAXES,
  CASE WHEN OL.`total_tax` = '' THEN 0 ELSE CAST(OL.`total_tax` AS FLOAT64) END AS ORDER_LINE_PRICE_TAXES,
  IF(
    (
      CAST(OL.`total_inc_tax` AS FLOAT64) - CAST(OL.`total_tax` AS FLOAT64)
    ) = 0 AND NOT OL.`total_tax` IS NULL,
    0,
    CAST(OL.`total_tax` AS FLOAT64) / (
      CAST(OL.`total_inc_tax` AS FLOAT64) - CAST(OL.`total_tax` AS FLOAT64)
    )
  ) AS ORDER_LINE_TAXES_RATE,
  CAST(OL.`cost_price_inc_tax` AS FLOAT64) AS LINE_PURCHASE_PRICE,
  (
    (
      CAST(OL.`total_inc_tax` AS FLOAT64) - CAST(OL.`cost_price_inc_tax` AS FLOAT64)
    ) / CAST(OL.`quantity` AS INT64)
  ) AS AVG_ORDER_LINE_MARGIN
FROM  `order_products` AS OL
LEFT JOIN  `orders` AS O
  ON O.`id` = OL.`order_id`;