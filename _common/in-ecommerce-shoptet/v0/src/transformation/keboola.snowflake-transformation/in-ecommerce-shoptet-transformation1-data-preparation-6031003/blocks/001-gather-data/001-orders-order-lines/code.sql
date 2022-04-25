--BDM_ORDERS

CREATE TABLE "order_totals" AS
SELECT O."code"                                             AS ORDER_ID
     , SUM(REPLACE(O."itemTotalPriceWithVat", ',', '.'))    AS ORDER_LINE_PRICE_WITH_VAT
     , SUM(REPLACE(O."itemTotalPriceWithoutVat", ',', '.')) AS ORDER_LINE_PRICE_WITHOUT_VAT
     , SUM(REPLACE(O."itemTotalPriceVat", ',', '.'))        AS ORDER_LINE_PRICE_VAT
     , SUM(REPLACE(O."itemVatRate", ',', '.'))              AS ORDER_LINE_VAT_RATE
FROM "orders" O
GROUP BY 1;

CREATE TABLE "bdm_orders" AS
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
              , REPLACE(O."totalPriceWithVat", ',', '.')       AS ORDER_TOTAL_PRICE_WITH_WAT
              , REPLACE(O."totalPriceWithoutVat", ',', '.')    AS ORDER_TOTAL_PRICE_WITHOUT_WAT
              , REPLACE(O."totalPriceVat", ',', '.')           AS ORDER_TOTAL_PRICE_VAT
              , REPLACE(O."rounding", ',', '.')                AS ORDER_PRICE_ROUNDING
              , REPLACE(O."priceToPay", ',', '.')              AS ORDER_TOTAL_PRICE_TO_PAY
              , REPLACE(O."paid", ',', '.')                    AS ORDER_TOTAL_PRICE_PAID

              , OT.ORDER_LINE_PRICE_WITH_VAT                   AS ORDER_LINE_PRICE_WITH_VAT
              , OT.ORDER_LINE_PRICE_WITHOUT_VAT                AS ORDER_LINE_PRICE_WITHOUT_VAT
              , OT.ORDER_LINE_PRICE_VAT                        AS ORDER_LINE_PRICE_VAT
              , OT.ORDER_LINE_VAT_RATE                         AS ORDER_LINE_VAT_RATE
FROM "orders" O
         JOIN "order_totals" OT ON O."code" = OT.ORDER_ID;

--BDM_ORDER_LINES
CREATE TABLE "bdm_order_lines" AS
SELECT O."code"                                                                          AS ORDER_ID
     -- TODO: review the logic, what if there's product change or what if there's more than 1000 items? What if price changes?
     -- Or what if there's 10 items with the same price.
     , O."code" || '-' || RIGHT('000' || ROW_NUMBER() OVER (PARTITION BY O."code" ORDER BY "itemAmount" DESC),
                                4)                                                       AS ORDER_LINE_ID
     , O."date"                                                                          AS ORDER_DATE
     , O."itemCode"                                                                      AS ORDER_LINE_PRODUCT_ID
     , O."orderItemType"                                                                 AS ORDER_ITEM_TYPE
     , "itemName"
     , O."orderItemDiscountPercent"                                                      AS DISCOUNT_PERCENT
     , REPLACE(IFNULL(NULLIF(O."itemAmount", ''), '0'), ',',
               '.')::DECIMAL(22, 5)                                                      AS ORDER_LINE_AMOUNT
     , REPLACE(IFNULL(NULLIF(O."itemTotalPriceWithVat", ''), '0'), ',',
               '.')::DECIMAL(22, 5)                                                      AS ORDER_LINE_PRICE_WITH_VAT
     , REPLACE(IFNULL(NULLIF(O."itemTotalPriceWithoutVat", ''), '0'), ',',
               '.')::DECIMAL(22, 5)                                                      AS ORDER_LINE_PRICE_WITHOUT_VAT
     , REPLACE(IFNULL(NULLIF(O."itemTotalPriceVat", ''), '0'), ',', '.')::DECIMAL(22, 5) AS ORDER_LINE_PRICE_VAT
     , REPLACE(IFNULL(NULLIF(O."itemVatRate", ''), '0'), ',', '.')::DECIMAL(22, 5)       AS ORDER_LINE_VAT_RATE
     , REPLACE(IFNULL(NULLIF(O."orderItemTotalPurchasePrice", ''), '0'), ',',
               '.')::DECIMAL(22, 5)                                                      AS LINE_PURCHASE_PRICE
FROM "orders" O;

--- Get billing and shipping details

CREATE TABLE "bdm_shipping_type" AS
SELECT DISTINCT "itemCode" AS SHIPPING_TYPE_ID
              , "itemName" AS NAME
FROM "orders"
WHERE "orderItemType" = 'shipping';

CREATE TABLE "bdm_billing_type" AS
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
