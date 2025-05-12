CREATE TABLE IF NOT EXISTS "posts_engagement"
(
    "uid" VARCHAR(1024) NOT NULL,
    "post_id" VARCHAR(1024),
    "source" VARCHAR(255),
    "date" DATE,
    "post_text" VARCHAR(1024),
    "shares" INTEGER,
    "views" INTEGER,
    "likes" INTEGER,
    "comments" INTEGER,
    "all_reactions" INTEGER
);

INSERT INTO "posts_engagement"
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
    0 AS "shares",
    ZEROIFNULL("statistics_viewCount") AS "views",
    ZEROIFNULL("statistics_likeCount") AS "likes",
    ZEROIFNULL("statistics_commentCount") AS "comments",
    "likes" + ZEROIFNULL("statistics_favoriteCount") + "comments" AS "all_reactions"
FROM
    "youtube_videosDetail";
