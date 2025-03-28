/* BDM_ORDERS */
CREATE TABLE `bdm_orders` (
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

/* BDM_ORDERS */
INSERT INTO `bdm_orders`
SELECT DISTINCT
  O.`id` AS ORDER_ID,
  DATE(PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%S%Ez', O.`created_at`))  AS ORDER_DATE,
  OFU.`status` AS ORDER_STATUS,
  IF(OFU.`status` = 'success', TRUE, FALSE) AS IS_SUCCESSFUL,
  CASE WHEN DATE(PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%S%Ez', O.`created_at`)) = `min_order_date` THEN TRUE ELSE FALSE END AS IS_FIRST_PURCHASE,
  O.`currency` AS ORDER_CURRENCY,
  O.`contact_email` AS ORDER_CUSTOMER_EMAIL,
  O.`note` AS ORDER_REMARK,
  IF(O.`contact_email` = '', NULL, O.`referring_site`) AS REFERER, /* If email is empty it is order made directly by cashier */
  NET.HOST(O.`referring_site`) AS CHANNEL,
  CASE
    WHEN CONTAINS_SUBSTR(NET.HOST(O.`referring_site`), 'google')
    THEN 'Google'
    WHEN CONTAINS_SUBSTR(NET.HOST(O.`referring_site`), 'seznam')
    THEN 'Seznam'
    WHEN CONTAINS_SUBSTR(NET.HOST(O.`referring_site`), 'facebook')
    THEN 'Facebook'
    ELSE NET.HOST(O.`referring_site`)
  END AS SOURCE,
  O.`billing_address__city` AS BILLING_CITY,
  O.`billing_address__country` AS BILLING_COUNTRY,
  O.`billing_address__zip` AS BILLING_ZIP,
  O.`shipping_address__city` AS SHIPPING_CITY,
  O.`shipping_address__country` AS SHIPPING_COUNTRY,
  O.`shipping_address__zip` AS SHIPPING_ZIP,
  CAST('' AS STRING) AS BILLING_TYPE,
  SPLIT(SPLIT(`shipping_lines`, "'code': '")[SAFE_OFFSET(1)], "', 'delivery_category")[SAFE_OFFSET(0)] AS SHIPPING_TYPE,
  CAST(O.`total_price` AS FLOAT64) AS ORDER_TOTAL_PRICE_WITH_TAXES,
  CAST(O.`total_price` AS FLOAT64) - CAST(O.`total_tax` AS FLOAT64) AS ORDER_TOTAL_PRICE_WITHOUT_TAXES,
  CAST(O.`total_tax` AS FLOAT64) AS ORDER_TOTAL_PRICE_TAXES,
  O.`customer_id` AS CUSTOMER_ID
FROM `order` AS O
LEFT JOIN `order_fulfillments` AS OFU
  ON O.`id` = OFU.`order_id`
LEFT JOIN (
  SELECT
    `customer_id`,
    MIN(DATE(PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%S%Ez', `created_at`))) AS `min_order_date`
  FROM `order`
  GROUP BY
    `customer_id`
) AS m
  ON o.`customer_id` = m.`customer_id`;

/* BDM_ORDER_LINES */
CREATE TABLE `bdm_order_lines` (
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

CREATE TABLE `tmp_order_lines` AS
SELECT
  O.`id` AS ORDER_ID,
  LI.`id` AS ORDER_LINE_ID,
  DATE(PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%S%Ez', O.`created_at`))AS ORDER_DATE,
  LI.`product_id` AS ORDER_LINE_PRODUCT_ID,
  LI.`name` AS ITEMNAME,
  CAST(ODA.`value` AS FLOAT64) AS DISCOUNT_PERCENT,
  CASE WHEN LI.`quantity` = '' THEN 0.0 ELSE CAST(LI.`quantity` AS FLOAT64) END AS ORDER_LINE_AMOUNT,
  CASE WHEN LI.`price` = '' THEN 0.0 ELSE CAST(LI.`price` AS FLOAT64) END AS ORDER_LINE_PRICE_WITH_TAXES,
  CASE
    WHEN LI.`price` = '' AND LITL.`price` = ''
    THEN 0.0
    WHEN LI.`price` <> '' AND LITL.`price` = ''
    THEN CAST(LI.`price` AS FLOAT64)
    WHEN LI.`price` = '' AND LITL.`price` <> ''
    THEN -CAST(LITL.`price` AS FLOAT64)
    ELSE CAST(LI.`price` AS FLOAT64) - CAST(LITL.`price` AS FLOAT64)
  END AS ORDER_LINE_PRICE_WITHOUT_TAXES,
  CASE WHEN LITL.`price` = '' THEN 0.0 ELSE CAST(LITL.`price` AS FLOAT64) END AS ORDER_LINE_PRICE_TAXES,
  CASE WHEN LITL.`rate` = '' THEN 0.0 ELSE CAST(LITL.`rate` AS FLOAT64) END AS ORDER_LINE_TAXES_RATE,
  CASE WHEN II.`cost` = '' THEN 0.0 ELSE CAST(II.`cost` AS FLOAT64) END AS LINE_PURCHASE_PRICE
FROM `line_item` AS LI
LEFT JOIN `order` AS O
  ON O.`id` = LI.`order_id`
LEFT JOIN `order_discount_applications` AS ODA
  ON O.`id` = ODA.`order_id`
LEFT JOIN `line_item_tax_lines` AS LITL
  ON LI.`id` = LITL.`line_item_id`
LEFT JOIN `product_variant` AS PV
  ON LI.`variant_id` = PV.`id`
LEFT JOIN `inventory_items` AS II
  ON PV.`inventory_item_id` = II.`id`
;

INSERT INTO `bdm_order_lines`
SELECT
  ORDER_ID,
  ORDER_LINE_ID,
  ORDER_DATE,
  ORDER_LINE_PRODUCT_ID,
  ITEMNAME,
  DISCOUNT_PERCENT,
  ORDER_LINE_AMOUNT,
  ORDER_LINE_PRICE_WITH_TAXES,
  ORDER_LINE_PRICE_WITHOUT_TAXES,
  ORDER_LINE_PRICE_TAXES,
  ORDER_LINE_TAXES_RATE,
  LINE_PURCHASE_PRICE,
	(CAST(ORDER_LINE_PRICE_WITH_TAXES AS FLOAT64) - CAST(LINE_PURCHASE_PRICE AS FLOAT64)) / ORDER_LINE_AMOUNT AS AVG_ORDER_LINE_MARGIN
 FROM `tmp_order_lines`
;