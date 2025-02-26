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
  CONCAT(CAST(`snippet_publishedAt` AS DATE), '-youtube-', `id`) AS `uid`,
  `id` AS `post_id`,
  'youtube' AS `source`,
  CAST(`snippet_publishedAt` AS DATE) AS `date`,
  `snippet_title` AS `post_text`,
  0 AS `shares`,
  IF(`statistics_viewCount` IS NULL, 0, `statistics_viewCount`) AS `views`,
  IF(`statistics_likeCount` IS NULL, 0, `statistics_likeCount`) AS `likes`,
  IF(`statistics_commentCount` IS NULL, 0, `statistics_commentCount`) AS `comments`,
  `likes` + IF(`statistics_favoriteCount` IS NULL, 0, `statistics_favoriteCount`) + `comments` AS `all_reactions`
FROM `youtube_videosDetail`