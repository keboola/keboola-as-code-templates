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
		'linkedin' as "source",
    try_to_date("time_bound_page_statistics"."timeRange_end") as "date",
    "views_allPageViews_pageViews" as "page_views_total",  
    "likeCount" as "page_followers",
    "impressionCount" as "page_posts_impressions" 
FROM
    "time_bound_page_statistics"
    JOIN "time_bound_share_statistics" ON "time_bound_page_statistics"."timeRange_end" = "time_bound_share_statistics"."timeRange_end";
