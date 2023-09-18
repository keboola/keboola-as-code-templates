CREATE TABLE "out_sms_campaign" AS
SELECT
    o."customer_id",
    c."first_name" AS "name",
    '+420123456789' AS "phone",
    count(li."product_id") AS "count",
    p."title",
    p."body_html"
FROM "order" o
JOIN "customer" c ON c."id" = o."customer_id"
JOIN "line-item" li ON li."order_id" = o."id"
JOIN "product" p ON p."id" = li."product_id"
WHERE o."customer_id" != ''
GROUP BY 1,2,5,6;
