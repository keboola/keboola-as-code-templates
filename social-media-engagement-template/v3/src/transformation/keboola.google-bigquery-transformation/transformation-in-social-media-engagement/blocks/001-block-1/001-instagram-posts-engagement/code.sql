CREATE TABLE IF NOT EXISTS `posts_engagement` (
  `uid` STRING(1024),
  `post_id` STRING(1024),
  `source` STRING(255),
  `date` DATE,
  `post_text` STRING(1024),
  `shares` INT64,
  `views` INT64,
  `likes` INT64,
  `comments` INT64,
  `all_reactions` INT64
)
INSERT INTO `posts_engagement`
WITH insights_pivoted AS (
  SELECT
    `"parent_id"` AS `parent_id`,
    MIN(`'engagement'`) AS `engagement`,
    MIN(`'impressions'`) AS `impressions`,
    MIN(`'reach'`) AS `reach`,
    MIN(`'saved'`) AS `saved`
  FROM (
    SELECT
      *
    FROM `instagram_media_lifetime_insights`
  )
  PIVOT(MAX(`value`) FOR `name` IN ('engagement', 'impressions', 'reach', 'saved'))
  GROUP BY
    `parent_id`
)
SELECT
  CONCAT(CAST(replace(`timestamp`, '+0000') AS DATE), '-instagram-', `instagram_media`.`id`) AS `uid`,
  `instagram_media`.`id` AS `post_id`,
  'instagram' AS `source`,
  CAST(replace(`timestamp`, '+0000') AS DATE) AS `date`,
  `caption` AS `post_text`,
  0 AS `shares`,
  0 AS `views`,
  IF(`like_count` IS NULL, 0, `like_count`) AS `likes`,
  IF(`comments_count` IS NULL, 0, `comments_count`) AS `comments`,
  `comments` + `likes` AS `all_reactions`
FROM `instagram_media`
LEFT JOIN insights_pivoted
  ON `instagram_media`.`id` = insights_pivoted.`parent_id`