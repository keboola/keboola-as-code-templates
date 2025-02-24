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
  	'facebook' 																																									AS source,
        SAFE_CAST(PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%S', REPLACE(end_time, '+0000', '')) AS DATE) AS date,       
        CAST(MIN(page_fans) AS INT64) 																													AS page_followers,        
        CAST(MIN(page_views_total) AS INT64) 																										AS page_views_total,
        CAST(MIN(page_impressions) AS INT64) 																										AS page_posts_impressions
	FROM

        (SELECT * FROM `facebook_page_insights` WHERE period = 'day')
        PIVOT (MAX(value) FOR name IN ('page_fan_adds', 'page_negative_feedback', 'page_views_total', 'page_impressions', 'page_consumptions', 'page_engaged_users', 'page_fans', 'page_fan_removes'))
        
  WHERE SAFE_CAST(PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%S', REPLACE(end_time, '+0000', '')) AS DATE) < CURRENT_DATE()
  GROUP BY SAFE_CAST(PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%S', REPLACE(end_time, '+0000', '')) AS DATE);
