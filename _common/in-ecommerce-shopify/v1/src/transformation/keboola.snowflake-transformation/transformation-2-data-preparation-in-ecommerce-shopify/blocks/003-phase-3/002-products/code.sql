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
   FROM "line_item" OP
       LEFT JOIN (SELECT 
                        "product_id",
                        SUM("quantity") AS UNITS_SOLD_LAST_MONTH
                    FROM "line_item" op
                    LEFT JOIN "order" o 
                        ON op."order_id" = o."id"
                    WHERE "created_at"::DATE >=DATE_TRUNC('DAY', CURRENT_DATE()) - INTERVAL '30 DAYS'
                       AND "created_at"::DATE <= CURRENT_DATE()
                    GROUP BY 1) P
            ON OP."product_id" = P."product_id"
       LEFT JOIN (SELECT 
                        "product_id",
                         SUM("quantity") AS UNITS_SOLD_LAST_90DAYS,
                         SUM("quantity") / 90 AS AVERAGE_UNITS_PER_DAY
                    FROM "line_item" op
                    LEFT JOIN "order" o 
                        ON op."order_id" = o."id"
                    WHERE "created_at"::DATE >=DATE_TRUNC('DAY', CURRENT_DATE()) - INTERVAL '90 DAYS'
                        AND "created_at"::DATE <= CURRENT_DATE()
                    GROUP BY 1) T
        ON OP."product_id" = T."product_id"
   GROUP BY 1,2,3;

--this calculates the average price and stock amount for each product variant
CREATE OR REPLACE TABLE "product_variant_totals" 
AS 
            SELECT p."id"                                        AS PRODUCT_ID,
                    AVG(IFF(pv."price" = '', null,pv."price"))   AS PRICE,
                    SUM(pv."inventory_quantity")                 AS PRODUCT_STOCK_AMOUNT,
                    AVG(IFF(ii."cost" = '', null, ii."cost" ))   AS PRODUCT_PURCHASE_PRICE
            FROM "product"p
                LEFT JOIN "product_variant" pv 
                    ON p."id"= pv."product_id"
                LEFT JOIN "inventory_items" ii 
                    ON pv."inventory_item_id" = ii."id"
            GROUP BY p."id";

--BDM_PRODUCTS
INSERT INTO  "bdm_products" 
     SELECT 
            P."id"                                                                    AS PRODUCT_ID
          , P."id"                                                                    AS PRODUCT_CODE
          , P."title"                                                                 AS PRODUCT_NAME
          , P."vendor"                                                                AS PRODUCT_MANUFACTURER
          , P."product_type"                                                          AS PRODUCT_TYPE
          , ''::STRING                                                                AS PRODUCT_EAN 
          ,PV.PRICE                                                                   AS PRODUCT_PRICE
          , NULL                                                                      AS PRODUCT_STANDARD_PRICE
          , PV.PRODUCT_PURCHASE_PRICE                                                 AS PRODUCT_PURCHASE_PRICE
          , PV.PRODUCT_STOCK_AMOUNT                                                   AS PRODUCT_STOCK_AMOUNT
          , 'insert www page with products' || P."handle"                             AS PRODUCT_URL
          , IFF(PT.TOTAL_UNITS_SOLD IS NULL, 0, PT.TOTAL_UNITS_SOLD)                  AS TOTAL_UNITS_SOLD
          , IFF(PT.UNITS_SOLD_LAST_MONTH IS NULL, 0,PT.UNITS_SOLD_LAST_MONTH)         AS UNITS_SOLD_LAST_MONTH
          , IFF(PT.AVG_SOLD_UNITS_PER_DAY is NULL, 0,PT.AVG_SOLD_UNITS_PER_DAY)       AS AVG_SOLD_UNITS_PER_DAY
          , DIV0(PV.PRODUCT_STOCK_AMOUNT, PT.AVG_SOLD_UNITS_PER_DAY )                 AS STOCK_REFILL
        , FALSE                                                                       AS IS_DELETED
     FROM "product" P
          LEFT JOIN "product_variant_totals" PV
               ON P."id"=PV.PRODUCT_ID
          LEFT JOIN "product_totals" PT 
               ON P."id" = PT.PRODUCT_ID;

--- ADD missing / deleted items

CREATE OR REPLACE TABLE "deleted_products" 
AS
     SELECT DISTINCT 
          "product_id"               AS PRODUCT_ID
          , ''::STRING               AS PRODUCT_TYPE
          , ANY_VALUE("name")        AS PRODUCT_NAME
     FROM "line_item" O
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
          , 'true'          AS IS_DELETED
     FROM "deleted_products" DP
     QUALIFY ROW_NUMBER() OVER (PARTITION BY DP.PRODUCT_ID ORDER BY DP.PRODUCT_TYPE) = 1
;

-- some do not have code
UPDATE "bdm_products"
SET PRODUCT_ID = 'N/A'
WHERE PRODUCT_ID = '';
