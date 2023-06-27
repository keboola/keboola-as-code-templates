--BDM_ORDERS

CREATE TABLE "order_totals" AS
SELECT O."code"                                             AS ORDER_ID
     , SUM(REPLACE(O."itemTotalPriceWithVat", ',', '.'))    AS ORDER_LINE_PRICE_WITH_TAXES
     , SUM(REPLACE(O."itemTotalPriceWithoutVat", ',', '.')) AS ORDER_LINE_PRICE_WITHOUT_TAXES
     , SUM(REPLACE(O."itemTotalPriceVat", ',', '.'))        AS ORDER_LINE_PRICE_TAXES
     , SUM(REPLACE(O."itemVatRate", ',', '.'))              AS ORDER_LINE_TAXES_RATE
FROM "orders" O
GROUP BY 1;

CREATE TABLE "bdm_orders"
(
    ORDER_ID VARCHAR(255) NOT NULL,
    ORDER_DATE TIMESTAMP,
    ORDER_STATUS VARCHAR(255),
    IS_SUCESSFUL BOOLEAN,
    IS_FIRST_PURCHASE BOOLEAN,
    ORDER_CURRENCY VARCHAR(255),
    ORDER_CURRENCY_FX_RATE INTEGER,
    ORDER_CUSTOMER_EMAIL VARCHAR(255),
    CUSTOMER_ID VARCHAR(255),
    CUSTOMER_REGULARITY_TYPE VARCHAR(255),
    DAYS_SINCE_PREVIOUS_ORDER INTEGER,
    ORDER_REMARK INTEGER,
    ORDER_SHOP_REMARK INTEGER,
    ORDER_PACKAGE_NUMBER INTEGER,
    ORDER_NOTE1 VARCHAR(255),
    ORDER_NOTE2 VARCHAR(255),
    ORDER_NOTE3 VARCHAR(255),
    ORDER_NOTE4 VARCHAR(255),
    ORDER_NOTE5 VARCHAR(255),
    ORDER_NOTE6 VARCHAR(255),
    ORDER_WEIGHT FLOAT,
    REFERER VARCHAR(255),
    CHANNEL VARCHAR(255),
    SOURCE VARCHAR(255),
    CUSTOMER_GROUP_NAME VARCHAR(255),
    CUSTOMER_GROUP_TYPE VARCHAR(255),
    CUSTOMER_TYPE VARCHAR(255),
    BILLING_CITY VARCHAR(255),
    BILLING_COUNTRY VARCHAR(255),
    BILLING_ZIP VARCHAR(255),
    SHIPPING_CITY VARCHAR(255),
    SHIPPING_COUNTRY VARCHAR(255),
    SHIPPING_ZIP VARCHAR(255),
    BILLING_TYPE VARCHAR(255),
    SHIPPING_TYPE VARCHAR(255),
    ORDER_TOTAL_PRICE_WITH_TAXES FLOAT,
    ORDER_TOTAL_PRICE_WITHOUT_TAXES FLOAT,
    ORDER_TOTAL_PRICE_TAXES FLOAT,
    ORDER_PRICE_ROUNDING FLOAT,
    ORDER_TOTAL_PRICE_TO_PAY FLOAT,
    ORDER_TOTAL_PRICE_PAID FLOAT,
    ORDER_LINE_PRICE_WITH_TAXES FLOAT,
    ORDER_LINE_PRICE_WITHOUT_TAXES FLOAT,
    ORDER_LINE_PRICE_TAXES FLOAT,
    ORDER_LINE_TAXES_RATE INTEGER
);

INSERT INTO "bdm_orders"
SELECT DISTINCT O."code"                                       AS ORDER_ID
              , O."date"                                       AS ORDER_DATE
              , O."statusName"                                 AS ORDER_STATUS
              , IFF(O."statusName" = 'Dokončeno', TRUE, FALSE) AS IS_SUCESSFUL
              , FALSE                                          AS IS_FIRST_PURCHASE
              , O."currency"                                   AS ORDER_CURRENCY
              , O."exchangeRate"                               AS ORDER_CURRENCY_FX_RATE
              , O."email"                                      AS ORDER_CUSTOMER_EMAIL
              -- to be added later
              , ''::TEXT                                       AS CUSTOMER_ID
              , ''::TEXT                                       AS CUSTOMER_REGULARITY_TYPE
              , 0::INT                                         AS DAYS_SINCE_PREVIOUS_ORDER

              , O."remark"                                     AS ORDER_REMARK
              , O."shopRemark"                                 AS ORDER_SHOP_REMARK
              , O."packageNumber"                              AS ORDER_PACKAGE_NUMBER
              , O."varchar1"                                   AS ORDER_NOTE1
              , O."varchar2"                                   AS ORDER_NOTE2
              , O."varchar3"                                   AS ORDER_NOTE3
              , O."text1"                                      AS ORDER_NOTE4
              , O."text2"                                      AS ORDER_NOTE5
              , O."text3"                                      AS ORDER_NOTE6
              , O."weight"                                     AS ORDER_WEIGHT
              -- If email is empty it is order made directly by cashier
              , IFF(O."email" = '', NULL, O."referer")         AS REFERER
              , PARSE_URL(O."referer"):host                    AS CHANNEL
              , CASE
                    WHEN CONTAINS(CHANNEL, 'google')
                        THEN 'Google'
                    WHEN CONTAINS(CHANNEL, 'seznam')
                        THEN 'Seznam'
                    WHEN CONTAINS(CHANNEL, 'facebook')
                        THEN 'Facebook'
                    ELSE CHANNEL END                           AS SOURCE
              , O."customerGroupName"                          AS CUSTOMER_GROUP_NAME
              , O."customerGroupType"                          AS CUSTOMER_GROUP_TYPE
              , O."customerType"                               AS CUSTOMER_TYPE
              , O."billCity"                                   AS BILLING_CITY
              , O."billCountryName"                            AS BILLING_COUNTRY
              , O."billZip"                                    AS BILLING_ZIP
              , O."deliveryCity"                               AS SHIPPING_CITY
              , O."deliveryCountryName"                        AS SHIPPING_COUNTRY
              , O."deliveryZip"                                AS SHIPPING_ZIP
              -- to be added later
              , ''::STRING                                     AS BILLING_TYPE
              , ''::STRING                                     AS SHIPPING_TYPE
              , REPLACE(O."totalPriceWithVat", ',', '.')       AS ORDER_TOTAL_PRICE_WITH_TAXES
              , REPLACE(O."totalPriceWithoutVat", ',', '.')    AS ORDER_TOTAL_PRICE_WITHOUT_TAXES
              , REPLACE(O."totalPriceVat", ',', '.')           AS ORDER_TOTAL_PRICE_TAXES
              , REPLACE(O."rounding", ',', '.')                AS ORDER_PRICE_ROUNDING
              , REPLACE(O."priceToPay", ',', '.')              AS ORDER_TOTAL_PRICE_TO_PAY
              , REPLACE(O."paid", ',', '.')                    AS ORDER_TOTAL_PRICE_PAID

              , OT.ORDER_LINE_PRICE_WITH_TAXES                   AS ORDER_LINE_PRICE_WITH_TAXES
              , OT.ORDER_LINE_PRICE_WITHOUT_TAXES                AS ORDER_LINE_PRICE_WITHOUT_TAXES
              , OT.ORDER_LINE_PRICE_TAXES                        AS ORDER_LINE_PRICE_TAXES
              , OT.ORDER_LINE_TAXES_RATE                         AS ORDER_LINE_TAXES_RATE
FROM "orders" O
         JOIN "order_totals" OT ON O."code" = OT.ORDER_ID;

--BDM_ORDER_LINES
CREATE TABLE "bdm_order_lines"
(
    ORDER_ID INTEGER NOT NULL,
    ORDER_LINE_ID VARCHAR(255),
    ORDER_DATE TIMESTAMP,
    ORDER_LINE_PRODUCT_ID VARCHAR(255),
    ORDER_ITEM_TYPE VARCHAR(255),
    ITEMNAME VARCHAR(255),
    DISCOUNT_PERCENT FLOAT,
    ORDER_LINE_AMOUNT FLOAT,
    ORDER_LINE_PRICE_WITH_TAXES FLOAT,
    ORDER_LINE_PRICE_WITHOUT_TAXES FLOAT,
    ORDER_LINE_PRICE_TAXES FLOAT,
    ORDER_LINE_TAXES_RATE FLOAT,
    LINE_PURCHASE_PRICE FLOAT
);

INSERT INTO "bdm_order_lines"
SELECT O."code"                                                                          AS ORDER_ID
     -- TODO: review the logic, what if there's product change or what if there's more than 1000 items? What if price changes?
     -- Or what if there's 10 items with the same price.
     , O."code" || '-' || RIGHT('000' || ROW_NUMBER() OVER (PARTITION BY O."code" ORDER BY "itemAmount" DESC),
                                4)                                                       AS ORDER_LINE_ID
     , O."date"                                                                          AS ORDER_DATE
     , O."itemCode"                                                                      AS ORDER_LINE_PRODUCT_ID
     , O."orderItemType"                                                                 AS ORDER_ITEM_TYPE
     , "itemName" as ITEMNAME
     , O."orderItemDiscountPercent"                                                      AS DISCOUNT_PERCENT
     , REPLACE(IFNULL(NULLIF(O."itemAmount", ''), '0'), ',',
               '.')::DECIMAL(22, 5)                                                      AS ORDER_LINE_AMOUNT
     , REPLACE(IFNULL(NULLIF(O."itemTotalPriceWithVat", ''), '0'), ',',
               '.')::DECIMAL(22, 5)                                                      AS ORDER_LINE_PRICE_WITH_TAXES
     , REPLACE(IFNULL(NULLIF(O."itemTotalPriceWithoutVat", ''), '0'), ',',
               '.')::DECIMAL(22, 5)                                                      AS ORDER_LINE_PRICE_WITHOUT_TAXES
     , REPLACE(IFNULL(NULLIF(O."itemTotalPriceVat", ''), '0'), ',', '.')::DECIMAL(22, 5) AS ORDER_LINE_PRICE_TAXES
     , REPLACE(IFNULL(NULLIF(O."itemVatRate", ''), '0'), ',', '.')::DECIMAL(22, 5)       AS ORDER_LINE_TAXES_RATE
     , REPLACE(IFNULL(NULLIF(O."orderItemTotalPurchasePrice", ''), '0'), ',',
               '.')::DECIMAL(22, 5)                                                      AS LINE_PURCHASE_PRICE
FROM "orders" O;

--- Get billing and shipping details
CREATE TABLE "bdm_shipping_type" 
(
    SHIPPING_TYPE_ID VARCHAR(255),
    NAME VARCHAR(255)
);

INSERT INTO "bdm_shipping_type"
SELECT DISTINCT "itemCode" AS SHIPPING_TYPE_ID
              , "itemName" AS NAME
FROM "orders"
WHERE "orderItemType" = 'shipping';

CREATE TABLE "bdm_billing_type" 
(
    BILLING_TYPE_ID VARCHAR(255),
    NAME VARCHAR(255)
);

INSERT INTO "bdm_billing_type"
SELECT DISTINCT "itemCode" AS BILLING_TYPE_ID
              , "itemName" AS NAME
FROM "orders"
WHERE "orderItemType" = 'billing';

--- remove product ids for billing shipping
UPDATE "bdm_order_lines"
SET ORDER_LINE_PRODUCT_ID='BILLING'
WHERE ORDER_ITEM_TYPE = 'billing';

UPDATE "bdm_order_lines"
SET ORDER_LINE_PRODUCT_ID='SHIPPING'
WHERE ORDER_ITEM_TYPE = 'shipping';

--- assign shipping, billing to order level
CREATE TABLE "order_billing_types" AS
SELECT DISTINCT "code"                   AS ORDER_ID
              , LISTAGG("itemName", ';') AS BILLING_TYPE
FROM "orders"
WHERE "orderItemType" IN ('billing')
GROUP BY 1;

CREATE TABLE "order_shipping_types" AS
SELECT DISTINCT "code"                   AS ORDER_ID
              , LISTAGG("itemName", ';') AS SHIPPING_TYPE
FROM "orders"
WHERE "orderItemType" IN ('shipping')
GROUP BY 1;

UPDATE "bdm_orders" O
SET O.SHIPPING_TYPE = ST.SHIPPING_TYPE
FROM "order_shipping_types" ST
WHERE O.ORDER_ID = ST.ORDER_ID;

UPDATE "bdm_orders" O
SET O.BILLING_TYPE = ST.BILLING_TYPE
FROM "order_billing_types" ST
WHERE O.ORDER_ID = ST.ORDER_ID;