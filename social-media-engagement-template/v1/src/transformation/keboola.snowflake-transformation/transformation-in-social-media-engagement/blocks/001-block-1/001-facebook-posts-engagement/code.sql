CREATE TABLE IF NOT EXISTS "posts_engagement"
(
    "uid" VARCHAR(1024) NOT NULL,
    "post_id" VARCHAR(1024),
    "source" VARCHAR(255),
    "date" DATE,
    "post_text" VARCHAR(5000),
    "shares" INTEGER,
    "views" INTEGER,
    "likes" INTEGER,
    "comments" INTEGER,
    "all_reactions" INTEGER
);

INSERT INTO "posts_engagement"
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
    0 AS "views",
    ZEROIFNULL("total_count") AS "likes",
    0 AS "comments",
    "shares" + "likes" AS "all_reactions"
FROM
    "facebook_feed" f1
    LEFT JOIN "facebook_feed_likes_summary" f2 ON f1."id" = f2."parent_id";
