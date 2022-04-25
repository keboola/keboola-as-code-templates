CREATE TABLE "out_shop" 
AS
   SELECT DISTINCT
      CASE 
         WHEN UPPER(split_part(split_part("order_status_url", 'https://',2),'.',1)) <> '' 
            THEN UPPER(split_part(split_part("order_status_url", 'https://',2),'.',1))
         WHEN UPPER(split_part(split_part("order_status_url", 'https://www.',2),'.',1)) <> ''
            THEN UPPER(split_part(split_part("order_status_url", 'https://www.',2),'.',1))
         ELSE UPPER(split_part(split_part("order_status_url", 'www.',2),'.',1))
      END                                                                                                       AS NAME,
      CASE 
         WHEN concat('https://', split_part(split_part("order_status_url", 'https://',2),'/',1)) <> '' 
            THEN concat('https://', split_part(split_part("order_status_url", 'https://',2),'/',1))
         WHEN concat('https://www.', split_part(split_part("order_status_url", 'https://www.',2),'/',1)) <> ''
            THEN concat('https://www.', split_part(split_part("order_status_url", 'https://www.',2),'/',1))
         ELSE concat('www.', split_part(split_part("order_status_url", 'www.',2),'/',1))
      END                                                                                                       AS BASE_URL,
      NULL                                                                                                      AS DOMAIN
   FROM "order"
;
