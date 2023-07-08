CREATE OR REPLACE TABLE "pages_engagement" AS
select
		'linkedin' as "source",
    try_to_date("time_bound_page_statistics"."timeRange_end") as "date",
    "views_allPageViews_pageViews" as "page_views_total",  
    "likeCount" as "page_followers",
    "impressionCount" as "page_posts_impressions"
    
from
    "time_bound_page_statistics"
    join "time_bound_share_statistics" on "time_bound_page_statistics"."timeRange_end" = "time_bound_share_statistics"."timeRange_end"
