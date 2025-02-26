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
  CAST(O.`created_at` AS DATE) AS ORDER_DATE,
  OFU.`status` AS ORDER_STATUS,
  IF(OFU.`status` = 'success', TRUE, FALSE) AS IS_SUCCESSFUL,
  CASE WHEN CAST(O.`created_at` AS DATE) = `min_order_date` THEN TRUE ELSE FALSE END AS IS_FIRST_PURCHASE,
  O.`currency` AS ORDER_CURRENCY,
  O.`contact_email` AS ORDER_CUSTOMER_EMAIL,
  O.`note` AS ORDER_REMARK,
  IF(O.`contact_email` = '', NULL, O.`referring_site`) AS REFERER, /* If email is empty it is order made directly by cashier */
  JSON_EXTRACT(PARSE_URL(O.`referring_site`), '$.host') AS CHANNEL,
  CASE
    WHEN CONTAINS_SUBSTR(CHANNEL, 'google')
    THEN 'Google'
    WHEN CONTAINS_SUBSTR(CHANNEL, 'seznam')
    THEN 'Seznam'
    WHEN CONTAINS_SUBSTR(CHANNEL, 'facebook')
    THEN 'Facebook'
    ELSE CHANNEL
  END AS SOURCE,
  O.`billing_address__city` AS BILLING_CITY,
  O.`billing_address__country` AS BILLING_COUNTRY,
  O.`billing_address__zip` AS BILLING_ZIP,
  O.`shipping_address__city` AS SHIPPING_CITY,
  O.`shipping_address__country` AS SHIPPING_COUNTRY,
  O.`shipping_address__zip` AS SHIPPING_ZIP,
  CAST('' AS STRING) AS BILLING_TYPE,
  SPLIT_PART(SPLIT_PART(`shipping_lines`, '\'code\': \'', 2), '\', \'delivery_category', 1) AS SHIPPING_TYPE,
  O.`total_price` AS ORDER_TOTAL_PRICE_WITH_TAXES,
  O.`total_price` - O.`total_tax` AS ORDER_TOTAL_PRICE_WITHOUT_TAXES,
  O.`total_tax` AS ORDER_TOTAL_PRICE_TAXES,
  O.`customer_id` AS CUSTOMER_ID
FROM `order` AS O
LEFT JOIN `order_fulfillments` AS OFU
  ON O.`id` = OFU.`order_id`
LEFT JOIN (
  SELECT
    `customer_id`,
    MIN(CAST(`created_at` AS DATE)) AS `min_order_date`
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

INSERT INTO `bdm_order_lines`
SELECT
  O.`id` AS ORDER_ID,
  LI.`id` AS ORDER_LINE_ID,
  CAST(O.`created_at` AS DATE) AS ORDER_DATE,
  LI.`product_id` AS ORDER_LINE_PRODUCT_ID,
  LI.`name` AS ITEMNAME,
  ODA.`value` AS DISCOUNT_PERCENT,
  CASE WHEN LI.`quantity` = '' THEN 0 ELSE LI.`quantity` END AS ORDER_LINE_AMOUNT,
  CASE WHEN LI.`price` = '' THEN 0 ELSE LI.`price` END AS ORDER_LINE_PRICE_WITH_TAXES,
  CASE
    WHEN LI.`price` = '' AND LITL.`price` = ''
    THEN 0
    WHEN LI.`price` <> '' AND LITL.`price` = ''
    THEN LI.`price`
    WHEN LI.`price` = '' AND LITL.`price` <> ''
    THEN -LITL.`price`
    ELSE LI.`price` - LITL.`price`
  END AS ORDER_LINE_PRICE_WITHOUT_TAXES,
  CASE WHEN LITL.`price` = '' THEN 0 ELSE LITL.`price` END AS ORDER_LINE_PRICE_TAXES,
  CASE WHEN LITL.`rate` = '' THEN 0 ELSE LITL.`rate` END AS ORDER_LINE_TAXES_RATE,
  CASE WHEN II.`cost` = '' THEN 0 ELSE II.`cost` END AS LINE_PURCHASE_PRICE,
  (
    ORDER_LINE_PRICE_WITH_TAXES - LINE_PURCHASE_PRICE
  ) / ORDER_LINE_AMOUNT AS AVG_ORDER_LINE_MARGIN
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
  ON PV.`inventory_item_id` = II.`id`;