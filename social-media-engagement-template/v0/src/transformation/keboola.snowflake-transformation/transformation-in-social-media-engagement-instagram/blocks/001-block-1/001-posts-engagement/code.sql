CREATE
OR REPLACE TABLE "posts_engagement" AS WITH insights_pivoted AS (
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
                "media_lifetime_insights"
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
        "media"."id"
    ) AS "uid",
    "media"."id" AS "post_id",
    'instagram' AS "source",
    try_to_date(replace("timestamp", '+0000')) AS "date",
    "caption" AS "post_text",
    NULL AS "shares",
    ZEROIFNULL("comments_count") AS "comments",
    ZEROIFNULL("like_count") AS "likes",
    NULL AS "views",
    "comments" + "likes" AS "all_reactions"
FROM
    "media"
    LEFT JOIN insights_pivoted ON "media"."id" = insights_pivoted."parent_id"
