/* create output repository table */ /* change flags to true/false */ /* format date */ /* mark Looker repositories based on changed files */
CREATE TABLE `out_repository` (
  `repository_id` STRING(255) NOT NULL,
  `repository` STRING(255),
  `project` STRING(255),
  `description` STRING(1024),
  `language` STRING(255),
  `has_wiki` BOOL,
  `has_issues` BOOL,
  `is_private` BOOL,
  `created_on` DATETIME,
  `url` STRING(1024)
)
INSERT INTO `out_repository`
SELECT
  `r`.`id` AS `repository_id`,
  `r`.`name` AS `repository`,
  '' AS `project`,
  IF(
    LENGTH(`r`.`description`) > 1024,
    LEFT(`r`.`description`, 1021) || '...',
    `r`.`description`
  ) AS `description`,
  IF(`r`.`language` = '', 'unknown', `r`.`language`) AS `language`,
  IF(`r`.`has_wiki` = '1', 'true', 'false') AS `has_wiki`,
  IF(`r`.`has_issues` = '1', 'true', 'false') AS `has_issues`,
  IF(`r`.`private` = '1', 'true', 'false') AS `is_private`,
  replace(LEFT(`r`.`created_at`, 19), 'T', ' ') AS `created_on`,
  `r`.`html_url` AS `url`
FROM `repos` AS `r`
/* format dates */ /* referential integrity check */ /* define if closed pull request is declined or merged */
CREATE TABLE `out_pull_request` (
  `pull_request_id` STRING(255) NOT NULL,
  `repository_id` STRING(255),
  `user_id` STRING(255),
  `title` STRING(255),
  `description` STRING(1024),
  `state` STRING(255),
  `created_on` DATETIME,
  `updated_on` DATETIME,
  `url` STRING(1024)
)
INSERT INTO `out_pull_request`
SELECT
  `p`.`id` AS `pull_request_id`,
  `r`.`repository_id`,
  COALESCE(`u`.`user_id`, '0') AS `user_id`,
  `p`.`title`,
  IF(LENGTH(`p`.`body`) > 1024, LEFT(`p`.`body`, 1021) || '...', `p`.`body`) AS `description`,
  (
    CASE
      WHEN `p`.`state` = 'closed' AND `p`.`merged_at` = ''
      THEN 'declined'
      WHEN `p`.`state` = 'closed' AND `p`.`merged_at` <> ''
      THEN 'merged'
      ELSE `p`.`state`
    END
  ) AS `state`,
  replace(LEFT(`p`.`created_at`, 19), 'T', ' ') AS `created_on`,
  replace(LEFT(`p`.`updated_at`, 19), 'T', ' ') AS `updated_on`,
  `p`.`html_url` AS `url`
FROM `pulls` AS `p`
INNER JOIN `out_repository` AS `r`
  ON `p`.`repo_name` = `r`.`repository`
LEFT JOIN `user` AS `u`
  ON `p`.`user_id` = `u`.`user_id`
/* easy deduplication of activity (there is no state which can change during time) */ /* format columns */
CREATE TABLE `out_pull_request_activity` (
  `pull_request_activity_id` STRING(255) NOT NULL,
  `pull_request_id` STRING(255),
  `user_id` STRING(255),
  `user` STRING(255),
  `date` DATETIME,
  `state` STRING(255),
  `title` STRING(255),
  `description` STRING(1024),
  `reason` STRING(1024)
)
INSERT INTO `out_pull_request_activity`
SELECT DISTINCT
  `opr`.`repository_id` || '_' || `opr`.`pull_request_id` || '_' || `pr`.`state` || '_' || LEFT(`pr`.`submitted_at`, 19) AS `pull_request_activity_id`,
  `opr`.`pull_request_id`,
  COALESCE(`u`.`user_id`, '0') AS `user_id`,
  COALESCE(`u`.`user`, 'External User') AS `user`,
  replace(LEFT(`pr`.`submitted_at`, 19), 'T', ' ') AS `date`,
  `pr`.`state`,
  LEFT(COALESCE(`pc`.`body`, `pr`.`body`), 255) AS `title`,
  IF(
    LENGTH(COALESCE(`pc`.`body`, `pr`.`body`)) > 1024,
    LEFT(COALESCE(`pc`.`body`, `pr`.`body`), 1021) || '...',
    `pr`.`body`
  ) AS `description`,
  CAST('' AS STRING) AS `reason`
FROM `pull_reviews` AS `pr`
INNER JOIN `out_pull_request` AS `opr`
  ON SPLIT_PART(`pr`.`html_url`, '#', 1) = `opr`.`url`
LEFT JOIN `user` AS `u`
  ON `pr`.`user_id` = `u`.`user_id`
LEFT JOIN `pull_comments` AS `pc`
  ON `pr`.`id` = `pc`.`pull_review_id`
WHERE
  `pr`.`state` <> ''
/* insert comments on pull request (those are gathered from issues endpoint) */ /* check if the timestamp is same as closing the request (GitHub action "comment and close") and mark such activity as 'DECLINED' */ /* format dates */
INSERT INTO `out_pull_request_activity` (
  `pull_request_activity_id`,
  `pull_request_id`,
  `user_id`,
  `user`,
  `date`,
  `state`,
  `title`,
  `description`,
  `reason`
)
SELECT
  `opr`.`repository_id` || '_' || `opr`.`pull_request_id` || '_COMMENTED_' || LEFT(`pic`.`created_at`, 19) AS `pull_request_activity_id`,
  `opr`.`pull_request_id`,
  COALESCE(`u`.`user_id`, '0') AS `user_id`,
  COALESCE(`u`.`user`, 'External User') AS `user`,
  replace(LEFT(`pic`.`created_at`, 19), 'T', ' ') AS `date`,
  IF(`p`.`id` IS NULL, 'COMMENTED', 'DECLINED') AS `state`,
  LEFT(`pic`.`body`, 255) AS `title`,
  IF(LENGTH(`pic`.`body`) > 1024, LEFT(`pic`.`body`, 1021) || '...', `pic`.`body`) AS `description`,
  IF(
    `p`.`id` IS NULL,
    '',
    IF(LENGTH(`pic`.`body`) > 1024, LEFT(`pic`.`body`, 1021) || '...', `pic`.`body`)
  ) AS `reason`
FROM `pull_issue_comments` AS `pic`
INNER JOIN `out_pull_request` AS `opr`
  ON SPLIT_PART(`pic`.`html_url`, '#', 1) = `opr`.`url`
LEFT JOIN `user` AS `u`
  ON `pic`.`user_id` = `u`.`user_id`
LEFT JOIN `pulls` AS `p`
  ON `opr`.`pull_request_id` = `p`.`id` AND `pic`.`created_at` = `p`.`closed_at`
/* add merge activity */
INSERT INTO `out_pull_request_activity` (
  `pull_request_activity_id`,
  `pull_request_id`,
  `user_id`,
  `user`,
  `date`,
  `state`,
  `title`,
  `description`,
  `reason`
)
SELECT
  `r`.`repository_id` || '_' || `p`.`id` || '_MERGED_' || LEFT(`p`.`merged_at`, 19) AS `pull_request_activity_id`,
  `p`.`id` AS `pull_request_id`,
  COALESCE(`u`.`user_id`, '0') AS `user_id`,
  COALESCE(`u`.`user`, 'External User') AS `user`,
  replace(LEFT(`p`.`merged_at`, 19), 'T', ' ') AS `date`,
  'MERGED' AS `state`,
  `p`.`title`,
  IF(LENGTH(`p`.`body`) > 1024, LEFT(`p`.`body`, 1021) || '...', `p`.`body`) AS `description`,
  '' AS `reason`
FROM `pulls` AS `p`
INNER JOIN `out_repository` AS `r`
  ON `p`.`repo_name` = `r`.`repository`
LEFT JOIN `user` AS `u`
  ON `p`.`user_id` = `u`.`user_id`
WHERE
  `p`.`merged_at` <> ''
/* create output commits table */
CREATE TABLE `out_repository_commit` (
  `repository_commit_id` STRING(255) NOT NULL,
  `repository_id` STRING(255),
  `user_id` STRING(255),
  `date` DATETIME,
  `url` STRING(1024),
  `message` STRING(1024)
)
INSERT INTO `out_repository_commit`
SELECT
  `c`.`sha` AS `repository_commit_id`,
  `or`.`repository_id`,
  COALESCE(`u`.`user_id`, '0') AS `user_id`,
  replace(LEFT(`c`.`commit_author_date`, 19), 'T', ' ') AS `date`,
  `c`.`html_url` AS `url`,
  IF(
    LENGTH(`c`.`commit_message`) > 1024,
    LEFT(`c`.`commit_message`, 1021) || '...',
    `c`.`commit_message`
  ) AS `message`
FROM `commits` AS `c`
INNER JOIN `out_repository` AS `or`
  ON `c`.`repo_name` = `or`.`repository`
LEFT JOIN `user` AS `u`
  ON `c`.`author_id` = `u`.`user_id`
/* create output issues table */
CREATE TABLE `out_issue` (
  `issue_id` STRING(255) NOT NULL,
  `repository_id` STRING(255),
  `user_id` STRING(255),
  `reporter` STRING(255),
  `number` STRING(255),
  `title` STRING(255),
  `description` STRING(1024),
  `state` STRING(255),
  `priority` STRING(255),
  `kind` STRING(255),
  `created_on` DATETIME,
  `updated_on` DATETIME,
  `url` STRING(1024)
)
INSERT INTO `out_issue`
SELECT
  `i`.`id` AS `issue_id`,
  `r`.`repository_id` AS `repository_id`,
  COALESCE(`u`.`user_id`, '0') AS `user_id`,
  `i`.`user_login` AS `reporter`,
  `i`.`id` AS `number`,
  `i`.`title`,
  IF(LENGTH(`i`.`body`) > 1024, LEFT(`i`.`body`, 1021) || '...', `i`.`body`) AS `description`,
  `i`.`state`,
  '' AS `priority`,
  '' AS `kind`,
  replace(LEFT(`i`.`created_at`, 19), 'T', ' ') AS `created_on`,
  replace(LEFT(`i`.`updated_at`, 19), 'T', ' ') AS `updated_on`,
  `i`.`html_url` AS `url`
FROM `issues` AS `i`
INNER JOIN `out_repository` AS `r`
  ON `i`.`repo_name` = `r`.`repository`
LEFT JOIN `user` AS `u`
  ON `i`.`assignee_id` = `u`.`user_id`
/* create output issue comments table */ /* bit confusing join, but we don't have issue id in comments, so we need to get it first by joining to raw issues table and then deal with referential integrity */
CREATE TABLE `out_issue_comment` (
  `issue_comment_id` STRING(255) NOT NULL,
  `issue_id` STRING(255),
  `user_id` STRING(255),
  `user` STRING(255),
  `description` STRING(1024),
  `created_on` DATETIME,
  `updated_on` DATETIME,
  `url` STRING(1024)
)
INSERT INTO `out_issue_comment`
SELECT
  `ic`.`id` AS `issue_comment_id`,
  `i`.`issue_id`,
  COALESCE(`u`.`user_id`, '0') AS `user_id`,
  COALESCE(`u`.`user`, 'External User') AS `user`,
  IF(LENGTH(`ic`.`body`) > 1024, LEFT(`ic`.`body`, 1021) || '...', `ic`.`body`) AS `description`,
  replace(LEFT(`i`.`created_on`, 19), 'T', ' ') AS `created_on`,
  replace(LEFT(`i`.`updated_on`, 19), 'T', ' ') AS `updated_on`,
  `ic`.`html_url` AS `url`
FROM `issue_comments` AS `ic`
LEFT JOIN `out_repository` AS `r`
  ON `ic`.`repo_name` = `r`.`repository`
LEFT JOIN `issues` AS `i2`
  ON `ic`.`repo_name` = `i2`.`repo_name` AND `ic`.`issue_number` = `i2`.`number`
INNER JOIN `out_issue` AS `i`
  ON `i2`.`id` = `i`.`issue_id`
LEFT JOIN `user` AS `u`
  ON `ic`.`user_id` = `u`.`user_id`
/* creating output events table from previously created tables, so it's possible to measure user's overall activity */
CREATE TABLE `out_event` (
  `event_id` STRING(255) NOT NULL,
  `repository_id` STRING(255),
  `user_id` STRING(255),
  `event` STRING(255),
  `date` DATETIME,
  `url` STRING(1024)
)
INSERT INTO `out_event`
SELECT
  `pull_request_id` || '_prc' AS `event_id`,
  `repository_id`,
  `user_id`,
  'Pull Request Created' AS `event`,
  `created_on` AS `date`,
  `url`
FROM `out_pull_request`
WHERE
  NOT `created_on` IS NULL
UNION ALL
SELECT
  `a`.`pull_request_activity_id` || '_pra' AS `event_id`,
  `r`.`repository_id`,
  `a`.`user_id`,
  'Pull Request ' || INITCAP(`a`.`state`) AS `event`,
  `a`.`date` AS `date`,
  '' AS `url`
FROM `out_pull_request_activity` AS `a`
LEFT JOIN `out_pull_request` AS `r`
  ON `a`.`pull_request_id` = `r`.`pull_request_id`
WHERE
  NOT `a`.`date` IS NULL
UNION ALL
SELECT
  `repository_commit_id` || '_c' AS `event_id`,
  `repository_id`,
  `user_id`,
  'Commit' AS `event`,
  `date` AS `date`,
  `url`
FROM `out_repository_commit`
WHERE
  NOT `date` IS NULL
UNION ALL
SELECT
  `issue_id` || '_icr' AS `event_id`,
  `repository_id`,
  `user_id`,
  'Issue Created' AS `event`,
  `created_on` AS `date`,
  `url`
FROM `out_issue`
WHERE
  NOT `created_on` IS NULL
UNION ALL
SELECT
  `c`.`issue_comment_id` || '_ico' AS `event_id`,
  `i`.`repository_id`,
  `c`.`user_id`,
  'Issue Comment' AS `event`,
  `c`.`created_on` AS `date`,
  `c`.`url`
FROM `out_issue_comment` AS `c`
LEFT JOIN `out_issue` AS `i`
  ON `c`.`issue_id` = `i`.`issue_id`
WHERE
  NOT `c`.`created_on` IS NULL