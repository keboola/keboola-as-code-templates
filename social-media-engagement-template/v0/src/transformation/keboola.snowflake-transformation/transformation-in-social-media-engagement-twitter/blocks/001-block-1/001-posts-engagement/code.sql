CREATE
OR REPLACE TABLE "posts_engagement" AS
SELECT
    CONCAT(try_to_date("created_at"), '-twitter-', "id") AS "uid",
    "id" AS "post_id",
    'twitter' AS "source",
    try_to_date("created_at") AS "date",
    "text" AS "post_text",
    ZEROIFNULL("retweet_count") AS "shares",
    NULL AS "views",
    ZEROIFNULL("favorite_count") AS "likes",
    NULL AS "comments",
    "likes" + "shares" AS "all_reactions"
FROM
    "tweets"
