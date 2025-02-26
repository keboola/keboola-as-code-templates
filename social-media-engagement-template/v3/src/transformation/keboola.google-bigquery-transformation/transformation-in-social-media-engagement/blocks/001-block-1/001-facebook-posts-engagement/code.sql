CREATE TABLE IF NOT EXISTS `posts_engagement` (
  `uid` STRING(1024) NOT NULL,
  `post_id` STRING(1024),
  `source` STRING(255),
  `date` DATE,
  `post_text` STRING(5000),
  `shares` INT64,
  `views` INT64,
  `likes` INT64,
  `comments` INT64,
  `all_reactions` INT64
)
INSERT INTO `posts_engagement`
SELECT
  CONCAT(CAST(replace(`created_time`, '+0000') AS DATE), '-facebook-', `id`) AS `uid`,
  `id` AS `post_id`,
  'facebook' AS `source`,
  CAST(replace(`created_time`, '+0000') AS DATE) AS `date`,
  `message` AS `post_text`,
  IF(try_to_numeric(`shares_count`) IS NULL, 0, try_to_numeric(`shares_count`)) AS `shares`,
  0 AS `views`,
  IF(`total_count` IS NULL, 0, `total_count`) AS `likes`,
  0 AS `comments`,
  `shares` + `likes` AS `all_reactions`
FROM `facebook_feed` AS f1
LEFT JOIN `facebook_feed_likes_summary` AS f2
  ON f1.`id` = f2.`parent_id`