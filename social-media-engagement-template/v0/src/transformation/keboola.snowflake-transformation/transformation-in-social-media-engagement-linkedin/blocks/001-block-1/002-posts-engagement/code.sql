CREATE
OR REPLACE TABLE "posts_engagement" AS
SELECT
    CONCAT(TO_DATE("createdAt"), '-linkedin-', "id") AS "uid",
    "id" AS "post_id",
    'linkedin' AS "source",
    TO_DATE("createdAt") AS "date",
    "commentary" AS "post_text",
    NULL AS "shares",
    NULL AS "views",
    ZEROIFNULL(COUNT("post_urn")) AS "likes",
    NULL AS "comments",
    "likes" AS "all_reactions"
FROM
    "posts"
    LEFT OUTER JOIN "likes" ON "posts"."id" = "likes"."post_urn"
GROUP BY
    "id",
    "createdAt",
    "commentary"
