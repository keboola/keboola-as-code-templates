CREATE
OR REPLACE TABLE "posts_engagement" AS
SELECT
    CONCAT(
        try_to_date("snippet_publishedAt"),
        '-youtube-',
        "id"
    ) AS "uid",
    "id" AS "post_id",
    'youtube' AS "source",
    try_to_date("snippet_publishedAt") AS "date",
    "snippet_title" AS "post_text",
    NULL AS "shares",
    ZEROIFNULL("statistics_viewCount") AS "views",
    ZEROIFNULL("statistics_likeCount") AS "likes",
    ZEROIFNULL("statistics_commentCount") AS "comments",
    "likes" + ZEROIFNULL("statistics_favoriteCount") + "comments" AS "all_reactions"
FROM
    "videosDetail"
