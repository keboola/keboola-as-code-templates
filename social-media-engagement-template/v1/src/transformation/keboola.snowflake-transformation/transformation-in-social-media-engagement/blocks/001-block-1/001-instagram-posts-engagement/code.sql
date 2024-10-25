CREATE TABLE IF NOT EXISTS "posts_engagement"
(
    "uid" VARCHAR(1024),
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
 WITH insights_pivoted AS (
    SELECT
        """parent_id""" AS "parent_id",
        MIN("'engagement'") AS "engagement",
        MIN("'impressions'") AS "impressions",
        MIN("'reach'") AS "reach",
        MIN("'saved'") AS "saved"
    FROM
        (
            SELECT
                *
            FROM
                "instagram_media_lifetime_insights"
        ) PIVOT (
            MAX("value") FOR "name" IN ('engagement', 'impressions', 'reach', 'saved')
        )
    GROUP BY
        "parent_id"
)
SELECT
    CONCAT(
        try_to_date(replace("timestamp", '+0000')),
        '-instagram-',
        "instagram_media"."id"
    ) AS "uid",
    "instagram_media"."id" AS "post_id",
    'instagram' AS "source",
    try_to_date(replace("timestamp", '+0000')) AS "date",
    "caption" AS "post_text",
    0 AS "shares",
    0 AS "views",
    ZEROIFNULL("like_count") AS "likes",
    ZEROIFNULL("comments_count") AS "comments",
    "comments" + "likes" AS "all_reactions"
FROM
    "instagram_media" 
    LEFT JOIN insights_pivoted ON "instagram_media"."id" = insights_pivoted."parent_id";
