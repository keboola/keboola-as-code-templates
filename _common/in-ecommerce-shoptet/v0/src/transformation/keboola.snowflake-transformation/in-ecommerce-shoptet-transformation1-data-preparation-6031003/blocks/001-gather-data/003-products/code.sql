--BDM_PRODUCTS

CREATE TABLE "bdm_products" AS
SELECT
    P."code"                                                                                     AS PRODUCT_ID
  , P."code"                                                                                     AS PRODUCT_CODE
  , P."pairCode"                                                                                 AS PRODUCT_CODE_2
  , P."guid"                                                                                     AS PRODUCT_GUID
  , P."name"                                                                                     AS PRODUCT_NAME
  , P."manufacturer"                                                                             AS PRODUCT_MANUFACTURER
  , P."itemType"                                                                                 AS PRODUCT_TYPE
  , P."ean"                                                                                      AS PRODUCT_EAN
  , REPLACE(NULLIF(P."price", ''), ',', '.')::DECIMAL(19, 2)                                     AS PRODUCT_PRICE
  , REPLACE(NULLIF(P."standardPrice", ''), ',', '.')::DECIMAL(19, 2)                             AS PRODUCT_STANDARD_PRICE
  , REPLACE(NULLIF(P."purchasePrice", ''), ',', '.')::DECIMAL(19, 2)                             AS PRODUCT_PURCHASE_PRICE
  , P."variantBarva"                                                                             AS PRODUCT_OPTION1
  , P."variantVelikost"                                                                          AS PRODUCT_OPTION2
  , 'Insert another varinat for product option'                                                  AS PRODUCT_OPTION3
  , S."stock"                                                                                    AS PRODUCT_STOCK_AMOUNT
  , P."defaultCategory"                                                                          AS CATEGORY
  , P."categoryText"                                                                             AS CATEGORY_TEXT
  , (SELECT "shop_base_url" FROM "shoptet" LIMIT 1) || '/admin/produkty-detail/?id=' || P."code" AS PRODUCT_URL
  , 'false'                                                                                      AS IS_DELETED
FROM
    "products" P
        LEFT JOIN "stocks" S
                  ON P."code" = S."itemCode";

--- ADD artificial
INSERT INTO "bdm_products"
SELECT 'BILLING'      AS PRODUCT_ID
     , 'BILLING'      AS PRODUCT_CODE
     , 'N/A'          AS PRODUCT_CODE_2
     , 'N/A'          AS PRODUCT_GUID
     , 'billing item' AS PRODUCT_NAME
     , 'N/A'          AS PRODUCT_MANUFACTURER
     , 'billing'      AS PRODUCT_TYPE
     , 'N/A'          AS PRODUCT_EAN
     , NULL           AS PRODUCT_PRICE
     , NULL           AS PRODUCT_STANDARD_PRICE
     , NULL           AS PRODUCT_PURCHASE_PRICE
     , 'N/A'          AS PRODUCT_OPTION1
     , 'N/A'          AS PRODUCT_OPTION2
     , 'N/A'          AS PRODUCT_OPTION3
     , NULL           AS PRODUCT_STOCK_AMOUNT
     , 'N/A'          AS CATEGORY
     , 'N/A'          AS CATEGORY_TEXT
     , 'N/A'          AS PRODUCT_URL
     , 'false'        AS IS_DELETED;

INSERT INTO "bdm_products"
SELECT 'SHIPPING'      AS PRODUCT_ID
     , 'SHIPPING'      AS PRODUCT_CODE
     , 'N/A'           AS PRODUCT_CODE_2
     , 'N/A'           AS PRODUCT_GUID
     , 'shipping item' AS PRODUCT_NAME
     , 'N/A'           AS PRODUCT_MANUFACTURER
     , 'shipping'      AS PRODUCT_TYPE
     , 'N/A'           AS PRODUCT_EAN
     , NULL            AS PRODUCT_PRICE
     , NULL            AS PRODUCT_STANDARD_PRICE
     , NULL            AS PRODUCT_PURCHASE_PRICE
     , 'N/A'          AS PRODUCT_OPTION1
     , 'N/A'          AS PRODUCT_OPTION2
     , 'N/A'          AS PRODUCT_OPTION3
     , NULL            AS PRODUCT_STOCK_AMOUNT
     , 'N/A'           AS CATEGORY
     , 'N/A'           AS CATEGORY_TEXT
     , 'N/A'           AS PRODUCT_URL
     , 'false'         AS IS_DELETED;

--- ADD missing / deleted items

CREATE TABLE "deleted_products" AS
SELECT DISTINCT "itemCode"            AS PRODUCT_ID
              , "orderItemType"       AS PRODUCT_TYPE
              , ANY_VALUE("itemName") AS PRODUCT_NAME
FROM "orders" O
         LEFT JOIN "products" P
                   ON O."itemCode" = P."code"
WHERE O."orderItemType" NOT IN ('shipping', 'billing')
  AND P."code" IS NULL
GROUP BY 1, 2
;

INSERT INTO "bdm_products"
SELECT DP.PRODUCT_ID   AS PRODUCT_ID
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
     , 'N/A'          AS PRODUCT_OPTION1
     , 'N/A'          AS PRODUCT_OPTION2
     , 'N/A'          AS PRODUCT_OPTION3
     , NULL            AS PRODUCT_STOCK_AMOUNT
     , 'N/A'           AS CATEGORY
     , 'N/A'           AS CATEGORY_TEXT
     , 'N/A'           AS PRODUCT_URL
     , 'true'          AS IS_DELETED
FROM "deleted_products" DP
    QUALIFY ROW_NUMBER() OVER (PARTITION BY DP.PRODUCT_ID ORDER BY DP.PRODUCT_TYPE) = 1;

-- some do not have code
UPDATE "bdm_products"
SET PRODUCT_ID = 'N/A'
WHERE PRODUCT_ID = '';
