  CREATE TABLE IF NOT EXISTS `pages_engagement`
(
        source                 STRING NOT NULL,
        date                   DATE NOT NULL,
        page_followers         INT64,
        page_views_total       INT64,
        page_posts_impressions INT64
);

INSERT INTO `pages_engagement`
SELECT
   'linkedin' 																										AS source,
   SAFE_CAST(TIMESTAMP(page.timeRange_end) AS DATE) 							AS date,
   CAST(likeCount AS INT64) 																			AS page_followers,
   CAST(views_allPageViews_pageViews AS INT64) 										AS page_views_total,  
   CAST(impressionCount AS INT64) 																AS page_posts_impressions
FROM
    `linkedin_time_bound_page_statistics` page
INNER JOIN `linkedin_time_bound_share_statistics` share
   ON SAFE_CAST(TIMESTAMP(page.timeRange_end) AS DATE)  = SAFE_CAST(TIMESTAMP(share.timeRange_end) AS DATE);
