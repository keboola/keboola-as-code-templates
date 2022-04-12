CREATE TABLE "out_shoptet" 
AS
    SELECT  "shop_name"         AS NAME
            , "shop_base_url"   AS BASE_URL
            , NULL              AS DOMAIN
    FROM "shoptet"
;
