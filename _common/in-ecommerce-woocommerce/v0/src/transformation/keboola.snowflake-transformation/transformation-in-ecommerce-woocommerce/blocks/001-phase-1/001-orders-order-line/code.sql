CREATE OR REPLACE TABLE "order_totals" 
 AS
    SELECT 
        O."id"                                                AS ORDER_ID,
        O."total"                                             AS ORDER_LINE_PRICE_WITH_TAXES,
        O."total" - O."total_tax"                             AS ORDER_LINE_PRICE_WITHOUT_TAXES,
        O."total_tax"                                         AS ORDER_LINE_PRICE_TAXES,
        AVG(O."total_tax"  / (O."total" - O."total_tax") )    AS ORDER_LINE_TAXES_RATE
   FROM "order" O
   GROUP BY 1,2,3,4;

-- bdm_orders table

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
        O."id"                                                    AS ORDER_ID,
        O."date_created"::DATE                                    AS ORDER_DATE,
        O."status"                                                AS ORDER_STATUS,
        IFF(O."status" = 'completed', TRUE, FALSE)                AS IS_SUCCESSFUL, 
        CASE 
             WHEN O."date_created" = "min_order_date" THEN TRUE
             ELSE FALSE
        END                                                       AS IS_FIRST_PURCHASE,
        O."currency"                                              AS ORDER_CURRENCY,
        iff(O."billing__email"='',C."email",O."billing__email")   AS ORDER_CUSTOMER_EMAIL, 
        O."customer_note"                                         AS ORDER_REMARK, 
        ''::STRING                                                AS REFERER,
        ''::STRING                                                AS CHANNEL,
        ''::STRING                                                AS SOURCE, 
        O."billing__city"                           		      AS BILLING_CITY,
        O."billing__country"                          		      AS BILLING_COUNTRY,
        O."billing__postcode"                          	          AS BILLING_ZIP,
        O."shipping__city"                        		          AS SHIPPING_CITY,
        O."shipping__country"                     	              AS SHIPPING_COUNTRY,
        O."shipping__postcode"                           	      AS SHIPPING_ZIP,
        O."payment_method"                                        AS BILLING_TYPE,
        ''::STRING                                                AS SHIPPING_TYPE,
        O."total"                                                 AS ORDER_TOTAL_PRICE_WITH_TAXES,
        O."total" - O."total_tax"                                 AS ORDER_TOTAL_PRICE_WITHOUT_TAXES,
        O."total_tax"                                             AS ORDER_TOTAL_PRICE_TAXES,
        O."customer_id"                                           AS CUSTOMER_ID
                                                              
    FROM "order" O
        LEFT JOIN "customer" C
                ON O."customer_id" = C."id"
        LEFT JOIN
                    (SELECT 
                        "customer_id",
                        MIN("date_created") AS "min_order_date"
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

INSERT INTO "bdm_order_lines"
    SELECT 
        OL."id"                                                                AS ORDER_LINE_ID,
    	OL."order_id"                                                          AS ORDER_ID,
    	O."date_created"::DATE                                                 AS ORDER_DATE,
        OL."product_id"                                                        AS ORDER_LINE_PRODUCT_ID,       
        OL."name"                                                              AS ITEMNAME,
        ((OL."subtotal" - OL."total") / OL."subtotal")                         AS DISCOUNT_PERCENT,
        CASE 
            WHEN OL."quantity"= '' THEN 0
            ELSE OL."quantity" 
        END                                                                    AS ORDER_LINE_AMOUNT,
        CASE 
            WHEN OL."total" = '' THEN 0
            ELSE OL."total"
        END                                                                    AS ORDER_LINE_PRICE_WITH_TAXES,
        OL."total" - OL."total_tax"                                            AS ORDER_LINE_PRICE_WITHOUT_TAXES,
        CASE 
            WHEN OL."total_tax" = '' THEN 0
            ELSE OL."total_tax"  
        END                                                                    AS ORDER_LINE_PRICE_TAXES,
        DIV0(OL."total_tax", (OL."total" - OL."total_tax"))                    AS ORDER_LINE_TAXES_RATE, 
        null                                                                   AS LINE_PURCHASE_PRICE, 
        null                                                                  AS AVG_ORDER_LINE_MARGIN
    
    
    FROM "order" O             
    	LEFT JOIN "order_line_items" OL
        	ON O."id" = OL."order_id";
