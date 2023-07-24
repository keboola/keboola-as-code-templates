CREATE TABLE "posts_engagement"
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
    CONCAT(try_to_date("created_at"), '-twitter-', "id") AS "uid",
    "id" AS "post_id",
    'twitter' AS "source",
    try_to_date("created_at") AS "date",
    "text" AS "post_text",
    ZEROIFNULL("retweet_count") AS "shares",
    0 AS "views",
    ZEROIFNULL("favorite_count") AS "likes",
    0 AS "comments",
    "likes" + "shares" AS "all_reactions"
FROM
    "tweets";
