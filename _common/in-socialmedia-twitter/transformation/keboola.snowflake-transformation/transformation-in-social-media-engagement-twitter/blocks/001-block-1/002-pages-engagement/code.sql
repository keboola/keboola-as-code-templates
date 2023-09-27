CREATE TABLE "pages_engagement"
(
    "source" VARCHAR(255) NOT NULL,
    "date" DATE NOT NULL,
    "page_followers" INTEGER,
    "page_views_total" INTEGER,
    "page_posts_impressions" INTEGER
);

INSERT INTO "pages_engagement"
SELECT
    'twitter' as "source",
    CURRENT_DATE() as "date",
    count(DISTINCT "id") as "page_followers",
    0 as "page_views_total",
    0 as "page_posts_impressions"
FROM
    "users"
WHERE
    "keboola_source" = 'followersList';
