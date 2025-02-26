CREATE TABLE IF NOT EXISTS `pages_engagement` (
  `source` STRING(255) NOT NULL,
  `date` DATE NOT NULL,
  `page_followers` INT64,
  `page_views_total` INT64,
  `page_posts_impressions` INT64
)
INSERT INTO `pages_engagement`
SELECT
  'facebook' AS `source`,
  CAST(replace(`"end_time"`, '+0000') AS DATE) AS `date`,
  MIN(`'page_fans'`) AS `page_followers`,
  MIN(`'page_views_total'`) AS `page_views_total`,
  MIN(`'page_impressions'`) AS `page_posts_impressions`
FROM (
  SELECT
    *
  FROM `facebook_page_insights`
  WHERE
    `period` = 'day'
)
PIVOT(MAX(`value`) FOR `name` IN ('page_fan_adds', 'page_negative_feedback', 'page_views_total', 'page_impressions', 'page_consumptions', 'page_engaged_users', 'page_fans', 'page_fan_removes'))
WHERE
  `date` < GETDATE()
GROUP BY
  `date`