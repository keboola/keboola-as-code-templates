CREATE TABLE "bdm_products" 
(
     PRODUCT_ID TEXT NOT NULL,
     PRODUCT_CODE TEXT,
     PRODUCT_NAME TEXT,
     PRODUCT_MANUFACTURER TEXT,
     PRODUCT_TYPE TEXT,
     PRODUCT_EAN TEXT,
     PRODUCT_PRICE FLOAT,
     PRODUCT_STANDARD_PRICE FLOAT,
     PRODUCT_PURCHASE_PRICE FLOAT,
     PRODUCT_STOCK_AMOUNT INTEGER,
     PRODUCT_URL TEXT,
     TOTAL_UNITS_SOLD INTEGER,
     UNITS_SOLD_LAST_MONTH INTEGER,
     AVG_SOLD_UNITS_PER_DAY FLOAT,
     STOCK_REFILL  FLOAT,  
     IS_DELETED BOOLEAN
);

--this calculates unit sales for each product over the last 30 days, 90 days
CREATE OR REPLACE TABLE "product_totals" 
 AS
    SELECT DISTINCT
        OP."product_id"                                                    AS PRODUCT_ID
        ,IFF(P.UNITS_SOLD_LAST_MONTH IS NULL, 0,P.UNITS_SOLD_LAST_MONTH)   AS UNITS_SOLD_LAST_MONTH
        ,IFF(T.AVERAGE_UNITS_PER_DAY IS NULL, 0,T.AVERAGE_UNITS_PER_DAY)   AS AVG_SOLD_UNITS_PER_DAY
        ,IFF(SUM(OP."quantity")IS NULL, 0, SUM(OP."quantity"))             AS TOTAL_UNITS_SOLD
   FROM "order_line_items" OP
       LEFT JOIN (SELECT 
                        "product_id",
                        SUM("quantity") AS UNITS_SOLD_LAST_MONTH
                    FROM "order_line_items" op
                    	LEFT JOIN "order" o 
                        ON op."order_id" = o."id"
                    WHERE "date_created"::DATE >=DATE_TRUNC('DAY', CURRENT_DATE()) - INTERVAL '30 DAYS'
                      AND "date_created"::DATE <= CURRENT_DATE()
                    GROUP BY 1) P
            ON OP."product_id" = P."product_id"
       LEFT JOIN (SELECT 
                        "product_id",
                         SUM("quantity") AS UNITS_SOLD_LAST_90DAYS,
                         SUM("quantity") / 90 AS AVERAGE_UNITS_PER_DAY
                    FROM "order_line_items" op
                    	LEFT JOIN "order" o 
                        ON op."order_id" = o."id"
                    WHERE "date_created"::DATE >=DATE_TRUNC('DAY', CURRENT_DATE()) - INTERVAL '90 DAYS'
                        AND "date_created"::DATE <= CURRENT_DATE()
                    GROUP BY 1) T
        ON OP."product_id" = T."product_id"
   GROUP BY 1,2,3;

INSERT INTO "bdm_products"
    SELECT 
          P."id"                                                       AS PRODUCT_ID
        , P."id"                                                       AS PRODUCT_CODE
        , P."name"                                                     AS PRODUCT_NAME
        , ''::STRING                                                   AS PRODUCT_MANUFACTURER
        , P."type"                                            	       AS PRODUCT_TYPE
        , P."sku"                                               	   AS PRODUCT_EAN 
        , iff(P."price" = '', 0, P."price")							   AS PRODUCT_PRICE
        , iff(P."regular_price" = '', 0, P."regular_price")            AS PRODUCT_STANDARD_PRICE
        , null                                                         AS PRODUCT_PURCHASE_PRICE						 
        , iff(P."stock_quantity" = '', 0, "stock_quantity")	           AS PRODUCT_STOCK_AMOUNT
        , iff(P."permalink" = '', P."external_url", P."permalink")     AS PRODUCT_URL
        , PT.TOTAL_UNITS_SOLD                                          AS TOTAL_UNITS_SOLD
        , PT.UNITS_SOLD_LAST_MONTH                                     AS UNITS_SOLD_LAST_MONTH
        , PT.AVG_SOLD_UNITS_PER_DAY                                    AS AVG_SOLD_UNITS_PER_DAY
        , DIV0(iff(P."stock_quantity" = '', 0, "stock_quantity"), PT.AVG_SOLD_UNITS_PER_DAY)         AS STOCK_REFILL
        , FALSE                                                        AS IS_DELETED
        
    FROM "product" P
      LEFT JOIN "product_totals" PT 
            ON P."id" = PT.PRODUCT_ID;

--- ADD missing / deleted items
CREATE OR REPLACE TABLE "deleted_products" 
AS
     SELECT DISTINCT 
          "product_id"               AS PRODUCT_ID
          , ''::STRING               AS PRODUCT_TYPE
          ,ANY_VALUE(O."name")       AS PRODUCT_NAME
     FROM "order_line_items" O
         LEFT JOIN "product" P
               ON O."product_id" = P."id"
     WHERE P."id" IS NULL
     GROUP BY 1, 2
;

INSERT INTO "bdm_products"
     SELECT 
         DP.PRODUCT_ID     AS PRODUCT_ID
          , DP.PRODUCT_ID   AS PRODUCT_CODE
          , DP.PRODUCT_NAME AS PRODUCT_NAME
          , 'N/A'           AS PRODUCT_MANUFACTURER
          , DP.PRODUCT_TYPE AS PRODUCT_TYPE
          , 'N/A'           AS PRODUCT_EAN
          , NULL            AS PRODUCT_PRICE
          , NULL            AS PRODUCT_STANDARD_PRICE
          , NULL            AS PRODUCT_PURCHASE_PRICE
          , NULL            AS PRODUCT_STOCK_AMOUNT
          , 'N/A'           AS PRODUCT_URL
          , NULL            AS TOTAL_UNITS_SOLD 
          , NULL            AS UNITS_SOLD_LAST_MONTH 
          , NULL            AS AVG_SOLD_UNITS_PER_DAY 
          , NULL            AS STOCK_REFILL
          , true            AS IS_DELETED
     FROM "deleted_products" DP
     QUALIFY ROW_NUMBER() OVER (PARTITION BY DP.PRODUCT_ID ORDER BY DP.PRODUCT_TYPE) = 1
;

-- some do not have code
UPDATE "bdm_products"
SET PRODUCT_ID = 'N/A'
WHERE PRODUCT_ID = '';
