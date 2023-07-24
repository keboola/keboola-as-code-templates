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
    CONCAT(TO_DATE("createdAt"), '-linkedin-', "id") AS "uid",
    "id" AS "post_id",
    'linkedin' AS "source",
    TO_DATE("createdAt") AS "date",
    "commentary" AS "post_text",
    0 AS "shares",
    0 AS "views",
    ZEROIFNULL(COUNT("post_urn")) AS "likes",
    0 AS "comments",
    "likes" AS "all_reactions"
FROM
    "posts"
    LEFT OUTER JOIN "likes" ON "posts"."id" = "likes"."post_urn"
GROUP BY
    "id",
    "createdAt",
    "commentary";
