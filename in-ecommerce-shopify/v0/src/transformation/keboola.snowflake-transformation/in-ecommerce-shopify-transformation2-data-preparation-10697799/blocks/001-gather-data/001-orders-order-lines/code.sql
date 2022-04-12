--BDM_ORDERS

CREATE OR REPLACE TABLE "order_totals" 
AS
    SELECT 
        O."id"                                                AS ORDER_ID,
        O."total_price"                                       AS ORDER_LINE_PRICE_WITH_VAT,
        O."total_price" - O."total_tax"                       AS ORDER_LINE_PRICE_WITHOUT_VAT,
        O."total_tax"                                         AS ORDER_LINE_PRICE_VAT,
        AVG(OTL."rate")                                     AS ORDER_LINE_VAT_RATE
    FROM "order" O
        LEFT JOIN "order_tax_lines" OTL 
                ON O."id" = OTL."order_id"
    GROUP BY 1,2,3,4;

CREATE OR REPLACE TABLE "bdm_orders" 
AS
    SELECT DISTINCT 
        O."id"                                                AS ORDER_ID,
        O."created_at"                                        AS ORDER_DATE,
        OFU."status"                                          AS ORDER_STATUS,
        IFF(OFU."status" = 'success', TRUE, FALSE)            AS IS_SUCESSFUL,
        FALSE                                                 AS IS_FIRST_PURCHASE,
        O."currency"                                          AS ORDER_CURRENCY,
        O."contact_email"                                     AS ORDER_CUSTOMER_EMAIL,
        O."note"                                              AS ORDER_REMARK,
        OFU."tracking_number"                                 AS ORDER_PACKAGE_NUMBER,
        O."total_weight"                                      AS ORDER_WEIGHT,
        -- If email is empty it is order made directly by cashier
        IFF(O."contact_email" = '', NULL, O."referring_site") AS REFERER,
        PARSE_URL(O."referring_site"):host                    AS CHANNEL,
        CASE
            WHEN CONTAINS(CHANNEL, 'google') THEN 'Google'
            WHEN CONTAINS(CHANNEL, 'seznam') THEN 'Seznam'
            WHEN CONTAINS(CHANNEL, 'facebook') THEN 'Facebook'
            ELSE CHANNEL 
        END                                                   AS SOURCE,
        O."billing_address__city"                             AS BILLING_CITY,
        O."billing_address__country"                          AS BILLING_COUNTRY,
        O."billing_address__zip"                              AS BILLING_ZIP,
        O."shipping_address__city"                            AS SHIPPING_CITY,
        O."shipping_address__country"                         AS SHIPPING_COUNTRY,
        O."shipping_address__zip"                             AS SHIPPING_ZIP,
        ''::STRING                                            AS BILLING_TYPE,
        ''::STRING                                            AS SHIPPING_TYPE,
        O."total_price"                                       AS ORDER_TOTAL_PRICE_WITH_WAT,
        O."total_price" - O."total_tax"                       AS ORDER_TOTAL_PRICE_WITHOUT_WAT,
        O."total_tax"                                         AS ORDER_TOTAL_PRICE_VAT,
        ''::TEXT                                              AS CUSTOMER_ID,
        ''::TEXT                                              AS CUSTOMER_REGULARITY_TYPE,
        0::INT                                                AS DAYS_SINCE_PREVIOUS_ORDER
              
    FROM "order" O
            LEFT JOIN "order_fulfillments" OFU 
                    ON O."id" = OFU."order_id";

--BDM_ORDER_LINES

CREATE OR REPLACE TABLE "bdm_order_lines" 
AS
    SELECT 
        O."id"                                                        AS ORDER_ID,
        LI."id"                                                       AS ORDER_LINE_ID,
        O."created_at"                                                AS ORDER_DATE,
        LI."product_id"                                               AS ORDER_LINE_PRODUCT_ID,
        LI."name"                                                     AS itemName,
        ODA."value"                                                   AS DISCOUNT_PERCENT,
        CASE
            WHEN LI."quantity" = '' THEN 0 
            ELSE LI."quantity" 
        END                                                           AS ORDER_LINE_AMOUNT,
        CASE 
            WHEN LI."price" = '' THEN 0 
            ELSE LI."price" 
        END                                                           AS ORDER_LINE_PRICE_WITH_VAT,
        CASE 
            WHEN LI."price" = '' AND LITL."price" = '' THEN 0 
            WHEN LI."price" <> '' AND LITL."price" = '' THEN LI. "price"
            WHEN LI."price" = '' AND LITL."price" <> '' THEN - LITL."price"
            ELSE LI."price" - LITL."price" 
        END                                                           AS ORDER_LINE_PRICE_WITHOUT_VAT,
        CASE 
            WHEN LITL."price" = '' THEN 0 
            ELSE LITL."price" 
        END                                                           AS ORDER_LINE_PRICE_VAT,
        CASE 
            WHEN LITL."rate" = '' THEN 0 
            ELSE LITL."rate" 
        END                                                           AS ORDER_LINE_VAT_RATE,
        CASE 
            WHEN II."cost" = '' THEN 0 
            ELSE II."cost" 
        END                                                           AS LINE_PURCHASE_PRICE
    FROM "line_item" LI
            LEFT JOIN "order" O 
                    ON O."id" = LI."order_id"
            LEFT JOIN "order_discount_applications" ODA 
                    ON O."id" = ODA."order_id"
            LEFT JOIN "line_item_tax_lines" LITL 
                    ON LI."id" = LITL."line_item_id"
            LEFT JOIN "product_variant" PV 
                    ON LI."variant_id" = PV."id"
            LEFT JOIN "inventory_items" II 
                    ON PV."inventory_item_id" = II."id";

--- Get billing and shipping details

CREATE OR REPLACE TABLE "bdm_shipping_type" 
AS
    SELECT 
        ROW_NUMBER() OVER(ORDER BY NAME) AS SHIPPING_TYPE_ID,
        NAME 
    FROM(
        SELECT DISTINCT 
            split_part(split_part("shipping_lines", '\'code\': \'',  2), '\', \'delivery_category',1) AS NAME
        FROM "order"
        )t;

CREATE OR REPLACE TABLE "bdm_billing_type" 
AS
    SELECT 
        ROW_NUMBER() OVER(ORDER BY NAME) AS BILLING_TYPE_ID, 
        NAME 
    FROM (
        SELECT DISTINCT CONCAT('Method: ', "processing_method", ', Gateway: ',"gateway", 
                       CASE WHEN "payment_details__credit_card_company" <> '' THEN CONCAT(', Credit Card Provider: ', "payment_details__credit_card_company")
                       ELSE '' END) AS NAME
        FROM "order") AS t;

/*
CREATE OR REPLACE TABLE "bdm_billing_type" 
AS
    SELECT 
        ROW_NUMBER() OVER (ORDER BY NAME) AS BILLING_TYPE_ID, 
        NAME 
    FROM (
            SELECT DISTINCT 
                CASE 
                    WHEN "payment_details__credit_card_company" IN ('Mastercard', 'Visa') AND "processing_method" = 'direct' AND "gateway" = 'stripe' 
                        THEN concat('On-line platba kartou - ', "payment_details__credit_card_company")
                    WHEN "payment_details__credit_card_company" IN ('Mastercard', 'Visa') AND "processing_method" = 'manual' AND "gateway" = 'Bank Deposit' 
                        THEN concat('Dobírka - platba kartou (',"payment_details__credit_card_company",')')
                    WHEN "payment_details__credit_card_company" = '' AND "processing_method" = 'manual' AND "gateway" = 'Bank Deposit' 
                        THEN 'Dobírka - hotově'
                    WHEN "payment_details__credit_card_company" = '' AND "processing_method" = 'manual' AND "gateway" = 'stripe' 
                        THEN 'On-line bankovní převod'
                    ELSE '' 
                END AS NAME
            FROM "order"
         ) AS t;
*/

--- assign shipping, billing to order level

CREATE TABLE "order_billing_types" 
AS
    SELECT DISTINCT 
        "id"                    AS ORDER_ID,
        concat('Method: ', "processing_method", ', Gateway: ',"gateway", 
                CASE 
                    WHEN "payment_details__credit_card_company" <> '' THEN CONCAT(', Credit Card Provider: ', "payment_details__credit_card_company")
                    ELSE '' 
                END)            AS BILLING_TYPE
    FROM "order";

CREATE TABLE "order_shipping_types" 
AS
    SELECT DISTINCT 
        "id"                                                                                      AS ORDER_ID,
        split_part(split_part("shipping_lines", '\'code\': \'',  2), '\', \'delivery_category',1) AS SHIPPING_TYPE
    FROM "order";

UPDATE "bdm_orders" O
SET O.SHIPPING_TYPE = ST.SHIPPING_TYPE
FROM "order_shipping_types" ST
WHERE O.ORDER_ID = ST.ORDER_ID;

UPDATE "bdm_orders" O
SET O.BILLING_TYPE = ST.BILLING_TYPE
FROM "order_billing_types" ST
WHERE O.ORDER_ID = ST.ORDER_ID;
