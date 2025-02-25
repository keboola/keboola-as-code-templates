--BDM_PRODUCTS
CREATE OR REPLACE TABLE "bdm_products" 
AS
     SELECT 
          P."id"                                                                               AS PRODUCT_ID
          , PV."id"                                                                            AS PRODUCT_CODE
          , ''::STRING                                                                         AS PRODUCT_CODE_2
          , ''::STRING                                                                         AS PRODUCT_GUID
          , P."title"                                                                          AS PRODUCT_NAME
          , P."vendor"                                                                         AS PRODUCT_MANUFACTURER
          , P."product_type"                                                                   AS PRODUCT_TYPE
          , PV."barcode"                                                                       AS PRODUCT_EAN
          , REPLACE(NULLIF(PV."price", ''), ',', '.')::DECIMAL(19, 2)                          AS PRODUCT_PRICE
          , NULL                                                                               AS PRODUCT_STANDARD_PRICE
          , NULL                                                                               AS PRODUCT_PURCHASE_PRICE
          , PV."option1"                                     						     AS PRODUCT_OPTION1
          , PV."option1"                                      							AS PRODUCT_OPTION2
          , PV."option3"														     AS PRODUCT_OPTION3
          , PV."inventory_quantity"                                                            AS PRODUCT_STOCK_AMOUNT
          , ''::string                                                                         AS CATEGORY
          , ''::string                                                                         AS CATEGORY_TEXT
          , 'insert www page with products' || P."handle"                                      AS PRODUCT_URL
          , 'false'                                                                            AS IS_DELETED
     FROM "product_variant" PV
          LEFT JOIN "product" P 
               ON P."id"=PV."product_id"
;

--- ADD missing / deleted items

CREATE OR REPLACE TABLE "deleted_products" 
AS
     SELECT DISTINCT 
          "product_id"               AS PRODUCT_ID
          , ''::STRING               AS PRODUCT_TYPE
          , ANY_VALUE("name")        AS PRODUCT_NAME
     FROM "line_item" O
         JOIN "product" P
               ON O."product_id" = P."id"
     WHERE P."id" IS NULL
     GROUP BY 1, 2
;

INSERT INTO "bdm_products"
     SELECT 
          DP.PRODUCT_ID     AS PRODUCT_ID
          , DP.PRODUCT_ID   AS PRODUCT_CODE
          , 'N/A'           AS PRODUCT_CODE_2
          , 'N/A'           AS PRODUCT_GUID
          , DP.PRODUCT_NAME AS PRODUCT_NAME
          , 'N/A'           AS PRODUCT_MANUFACTURER
          , DP.PRODUCT_TYPE AS PRODUCT_TYPE
          , 'N/A'           AS PRODUCT_EAN
          , NULL            AS PRODUCT_PRICE
          , NULL            AS PRODUCT_STANDARD_PRICE
          , NULL            AS PRODUCT_PURCHASE_PRICE
          , 'N/A'           AS PRODUCT_OPTION1
          , 'N/A'           AS PRODUCT_OPTION2
          , 'N/A'           AS PRODUCT_OPTION3
          , NULL            AS PRODUCT_STOCK_AMOUNT
          , 'N/A'           AS CATEGORY
          , 'N/A'           AS CATEGORY_TEXT
          , 'N/A'           AS PRODUCT_URL
          , 'true'          AS IS_DELETED
     FROM "deleted_products" DP
     QUALIFY ROW_NUMBER() OVER (PARTITION BY DP.PRODUCT_ID ORDER BY DP.PRODUCT_TYPE) = 1
;

-- some do not have code
UPDATE "bdm_products"
SET PRODUCT_ID = 'N/A'
WHERE PRODUCT_ID = '';
