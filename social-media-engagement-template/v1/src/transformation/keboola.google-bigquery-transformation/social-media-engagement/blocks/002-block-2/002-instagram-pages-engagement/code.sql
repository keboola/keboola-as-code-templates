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
        'instagram' 																																						AS source,
        SAFE_CAST(PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%S', REPLACE(end_time, '+0000', '')) AS DATE) AS date,
        CAST(MIN(follower_count) AS INT64)  																										AS page_followers,
        CAST(MIN(profile_views) AS INT64) 																											AS page_views_total, 
        CAST(MIN(impressions) AS INT64) 																												AS page_posts_impressions
          
    FROM
        (SELECT * FROM `instagram_page_daily_insights`)
        PIVOT (MAX(value) FOR name IN ('reach', 'website_clicks', 'phone_call_clicks', 'email_contacts', 'profile_views', 'get_directions_clicks', 'text_message_clicks', 'impressions', 'follower_count'))
    GROUP BY SAFE_CAST(PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%S', REPLACE(end_time, '+0000', '')) AS DATE);
