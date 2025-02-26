CREATE TABLE IF NOT EXISTS `pages_engagement` (
  `source` STRING(255) NOT NULL,
  `date` DATE NOT NULL,
  `page_followers` INT64,
  `page_views_total` INT64,
  `page_posts_impressions` INT64
);

INSERT INTO `pages_engagement`
SELECT
  'linkedin' AS `source`,
  CAST(l1.`timeRange_end` AS DATE) AS `date`,
  `likeCount` AS `page_followers`,
  `views_allPageViews_pageViews` AS `page_views_total`,
  `impressionCount` AS `page_posts_impressions`
FROM `linkedin_time_bound_page_statistics` AS l1
JOIN `linkedin_time_bound_share_statistics` AS l2
  ON l1.`timeRange_end` = l2.`timeRange_end`;