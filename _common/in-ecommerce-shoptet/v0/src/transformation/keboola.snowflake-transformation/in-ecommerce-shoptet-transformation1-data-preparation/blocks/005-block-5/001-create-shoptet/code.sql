CREATE TABLE "out_shoptet" 
(
   NAME VARCHAR(255),
   BASE_URL VARCHAR(1024),
   DOMAIN VARCHAR(255)
);

INSERT INTO "out_shoptet" 
    SELECT  "shop_name"         AS NAME
            , "shop_base_url"   AS BASE_URL
            , NULL              AS DOMAIN
    FROM "shoptet"
;
