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

INSERT INTO "bdm_orders"
    SELECT DISTINCT 
        O."id"                                                                  AS ORDER_ID,
        O."date_created"::DATE                                                  AS ORDER_DATE,
        O."status"                                                              AS ORDER_STATUS,
        IFF(O."status" = 'Completed', TRUE, FALSE)                              AS IS_SUCCESSFUL,
        CASE 
             WHEN O."date_created"::DATE = "min_order_date" THEN TRUE
             ELSE FALSE
        END                                                                     AS IS_FIRST_PURCHASE,
        O."currency_code"                                                       AS ORDER_CURRENCY,
        IFF(O."billing_address_email"='',C."email",O."billing_address_email")   AS ORDER_CUSTOMER_EMAIL,
        O."customer_message"                                                    AS ORDER_REMARK, 
        ''::STRING                                                              AS REFERER,
        ''::STRING                                                              AS CHANNEL,
        ''::STRING                                                              AS SOURCE, 
        O."billing_address_city"                           		                AS BILLING_CITY,
        O."billing_address_country"                          	                AS BILLING_COUNTRY,
        O."billing_address_zip"                          	                    AS BILLING_ZIP,
        ''::STRING                        		                                AS SHIPPING_CITY, 
        ''::STRING                     	                                        AS SHIPPING_COUNTRY,
        ''::STRING                            	                                AS SHIPPING_ZIP,
        O."payment_method"                                                      AS BILLING_TYPE,
        ''::STRING                                                              AS SHIPPING_TYPE,
        O."total_inc_tax"                                                       AS ORDER_TOTAL_PRICE_WITH_TAXES,
        O."total_ex_tax"                                                        AS ORDER_TOTAL_PRICE_WITHOUT_TAXES,
        O."total_tax"                                                           AS ORDER_TOTAL_PRICE_TAXES,
        O."customer_id"                                                         AS CUSTOMER_ID
          
    FROM "orders" O
        LEFT JOIN "customers" C
            ON O."customer_id" = C."id"
        LEFT JOIN
                    (SELECT 
                        "customer_id",
                        MIN("date_created"::DATE) AS "min_order_date"
                    FROM
                        "orders"
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

INSERT INTO "bdm_order_lines"
    SELECT 
        O."id"                                                                       AS ORDER_ID,
        OL."id"                                                                      AS ORDER_LINE_ID,
        O."date_created"::DATE                                                       AS ORDER_DATE,
        OL."product_id"                                                              AS ORDER_LINE_PRODUCT_ID,       
        OL."name"                                                                    AS ITEMNAME,
        ((OL."total_inc_tax" - OL."discounted_total_inc_tax")
                    / OL."total_inc_tax")                                            AS DISCOUNT_PERCENT,
        CASE 
            WHEN OL."quantity"= '' THEN 0
            ELSE OL."quantity" 
        END                                                                          AS ORDER_LINE_AMOUNT,
        CASE 
            WHEN OL."total_inc_tax" = '' THEN 0
            ELSE OL."total_inc_tax"
        END                                                                          AS ORDER_LINE_PRICE_WITH_TAXES,
        CASE 
            WHEN OL."total_ex_tax" = '' THEN 0
            ELSE OL."total_ex_tax"
        END                                                                          AS ORDER_LINE_PRICE_WITHOUT_TAXES,
        CASE 
            WHEN OL."total_tax" = '' THEN 0
            ELSE OL."total_tax"  
        END                                                                         AS ORDER_LINE_PRICE_TAXES,
        DIV0(OL."total_tax", (OL."total_inc_tax" - OL."total_tax"))                 AS ORDER_LINE_TAXES_RATE, 
        OL."cost_price_inc_tax"                                                     AS LINE_PURCHASE_PRICE, 
        ((OL."total_inc_tax" - OL."cost_price_inc_tax") / OL."quantity")            AS AVG_ORDER_LINE_MARGIN
      
    FROM "order_products" OL                
        LEFT JOIN "orders" O
            ON O."id" = OL."order_id";
