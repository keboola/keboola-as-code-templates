CREATE
OR REPLACE TABLE "pages_engagement" AS
select
    'twitter' as "source",
    CURRENT_DATE() as "date",
    count(DISTINCT "id") as "page_followers",
    
    null as "page_posts_impressions",
    null as "page_views_total"
from
    "users"
where
    "keboola_source" = 'followersList'
