CREATE
OR REPLACE TABLE "posts_engagement" AS
SELECT
    CONCAT(
        try_to_date(replace("created_time", '+0000')),
        '-facebook-',
        "id"
    ) AS "uid",
    "id" AS "post_id",
    'facebook' AS "source",
    try_to_date(replace("created_time", '+0000')) AS "date",
    "message" AS "post_text",
    ZEROIFNULL(try_to_numeric("shares_count")) AS "shares",
    NULL AS "views",
    ZEROIFNULL("total_count") AS "likes",
    NULL AS "comments",
    "shares" + "likes" AS "all_reactions"
FROM
    "feed"
    LEFT JOIN "feed_likes_summary" ON "feed"."id" = "feed_likes_summary"."parent_id"
