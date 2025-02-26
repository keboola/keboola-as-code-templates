CREATE TABLE IF NOT EXISTS `posts_engagement` (
  `uid` STRING(1024) NOT NULL,
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
SELECT
  CONCAT(CAST(`createdAt` AS DATE), '-linkedin-', `id`) AS `uid`,
  `id` AS `post_id`,
  'linkedin' AS `source`,
  CAST(`createdAt` AS DATE) AS `date`,
  `commentary` AS `post_text`,
  0 AS `shares`,
  0 AS `views`,
  IF(COUNT(`post_urn`) IS NULL, 0, COUNT(`post_urn`)) AS `likes`,
  0 AS `comments`,
  `likes` AS `all_reactions`
FROM `linkedin_posts`
LEFT OUTER JOIN `linkedin_likes`
  ON `linkedin_posts`.`id` = `linkedin_likes`.`post_urn`
GROUP BY
  `id`,
  `createdAt`,
  `commentary`