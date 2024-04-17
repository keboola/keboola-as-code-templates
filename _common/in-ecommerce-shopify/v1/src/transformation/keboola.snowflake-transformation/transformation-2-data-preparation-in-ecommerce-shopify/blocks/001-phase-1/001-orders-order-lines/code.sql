--BDM_ORDERS

 CREATE TABLE "bdm_orders" 
(
    ORDER_ID TEXT NOT NULL,
    ORDER_DATE DATE,
    ORDER_STATUS TEXT,
    IS_SUCCESSFUL BOOLEAN,
    IS_FIRST_PURCHASE BOOLEAN,
    ORDER_CURRENCY TEXT,
    ORDER_CUSTOMER_EMAIL TEXT,
    ORDER_REMARK TEXT,
    REFERER TEXT,
    CHANNEL TEXT,
    SOURCE TEXT,
    BILLING_CITY TEXT,
    BILLING_COUNTRY TEXT,
    BILLING_ZIP TEXT,
    SHIPPING_CITY TEXT,
    SHIPPING_COUNTRY TEXT,
    SHIPPING_ZIP TEXT,
    BILLING_TYPE TEXT,
    SHIPPING_TYPE TEXT,
    ORDER_TOTAL_PRICE_WITH_TAXES FLOAT,
    ORDER_TOTAL_PRICE_WITHOUT_TAXES FLOAT,
    ORDER_TOTAL_PRICE_TAXES FLOAT,
    CUSTOMER_ID TEXT
);

--BDM_ORDERS
INSERT INTO "bdm_orders"
    SELECT DISTINCT 
        O."id"                                                AS ORDER_ID,
        O."created_at"::DATE                                  AS ORDER_DATE,
        OFU."status"                                          AS ORDER_STATUS,
        IFF(OFU."status" = 'success', TRUE, FALSE)            AS IS_SUCCESSFUL,
        CASE 
            WHEN O."created_at"::DATE = "min_order_date" THEN TRUE 
            ELSE FALSE
        END                                                   AS IS_FIRST_PURCHASE,
        O."currency"                                          AS ORDER_CURRENCY,
        O."contact_email"                                     AS ORDER_CUSTOMER_EMAIL,
        O."note"                                              AS ORDER_REMARK,
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
        split_part(split_part("shipping_lines", '\'code\': \'',  2), '\', \'delivery_category',1) AS SHIPPING_TYPE, 
        O."total_price"                                       AS ORDER_TOTAL_PRICE_WITH_TAXES,
        O."total_price" - O."total_tax"                       AS ORDER_TOTAL_PRICE_WITHOUT_TAXES,
        O."total_tax"                                         AS ORDER_TOTAL_PRICE_TAXES,
        O. "customer_id"                                      AS CUSTOMER_ID 
      
              
    FROM "order" O
            LEFT JOIN "order_fulfillments" OFU 
                    ON O."id" = OFU."order_id"
             LEFT JOIN
                    (SELECT 
                        "customer_id",
                        MIN("created_at"::DATE) AS "min_order_date"
                    FROM
                        "order"
                    GROUP BY "customer_id") m
            ON o."customer_id" = m."customer_id";

--BDM_ORDER_LINES

CREATE TABLE "bdm_order_lines" 
(
    ORDER_ID TEXT,
    ORDER_LINE_ID TEXT NOT NULL,
    ORDER_DATE DATE,
    ORDER_LINE_PRODUCT_ID TEXT,
    ITEMNAME TEXT,
    DISCOUNT_PERCENT FLOAT,
    ORDER_LINE_AMOUNT FLOAT,
    ORDER_LINE_PRICE_WITH_TAXES FLOAT,
    ORDER_LINE_PRICE_WITHOUT_TAXES FLOAT,
    ORDER_LINE_PRICE_TAXES FLOAT,
    ORDER_LINE_TAXES_RATE FLOAT,
    LINE_PURCHASE_PRICE FLOAT,
    AVG_ORDER_LINE_MARGIN FLOAT
);

INSERT  INTO "bdm_order_lines" 
    SELECT 
        O."id"                                                        AS ORDER_ID,
        LI."id"                                                       AS ORDER_LINE_ID,
        O."created_at"::DATE                                          AS ORDER_DATE,
        LI."product_id"                                               AS ORDER_LINE_PRODUCT_ID,
        LI."name"                                                     AS ITEMNAME,
        ODA."value"                                                   AS DISCOUNT_PERCENT,
        CASE
            WHEN LI."quantity" = '' THEN 0 
            ELSE LI."quantity" 
        END                                                           AS ORDER_LINE_AMOUNT,
        CASE 
            WHEN LI."price" = '' THEN 0 
            ELSE LI."price" 
        END                                                           AS ORDER_LINE_PRICE_WITH_TAXES,
        CASE 
            WHEN LI."price" = '' AND LITL."price" = '' THEN 0 
            WHEN LI."price" <> '' AND LITL."price" = '' THEN LI. "price"
            WHEN LI."price" = '' AND LITL."price" <> '' THEN - LITL."price"
            ELSE LI."price" - LITL."price" 
        END                                                           AS ORDER_LINE_PRICE_WITHOUT_TAXES,
        CASE 
            WHEN LITL."price" = '' THEN 0 
            ELSE LITL."price" 
        END                                                           AS ORDER_LINE_PRICE_TAXES,
        CASE 
            WHEN LITL."rate" = '' THEN 0 
            ELSE LITL."rate" 
        END                                                           AS ORDER_LINE_TAXES_RATE,
        CASE 
            WHEN II."cost" = '' THEN 0 
            ELSE II."cost" 
        END                                                           AS LINE_PURCHASE_PRICE,
        (ORDER_LINE_PRICE_WITH_TAXES - LINE_PURCHASE_PRICE) /ORDER_LINE_AMOUNT AS AVG_ORDER_LINE_MARGIN 
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
