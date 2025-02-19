/* create base users table */ /* get email domain from email */ /* identify employees by the domain - CHANGE ACCORDINGLY!!! */
CREATE TABLE `out_user` (
  `user_id` STRING(255) NOT NULL,
  `user` STRING(255),
  `email` STRING(255),
  `email_domain` STRING(255),
  `user_type` STRING(255)
)
INSERT INTO `out_user`
SELECT
  `id` AS `user_id`,
  `name` AS `user`,
  `email`,
  SPLIT_PART(`email`, '@', 2) AS `email_domain`,
  IF(`email_domain` LIKE '%keboola.com', 'employee', 'external') AS `user_type`
FROM `users_details`
INSERT INTO `out_user` (
  `user_id`,
  `user`
)
VALUES
  ('0', 'Unknown')
/* creating output table with projects */ /* date to simple format */ /* add workspace name to the projects */ /* change boolean values to true/false */
CREATE TABLE `out_project` (
  `project_id` STRING(255) NOT NULL,
  `project` STRING(255),
  `created_at` DATETIME,
  `due_date` STRING(255),
  `workspace` STRING(255),
  `url` STRING(1024),
  `owner` STRING(255),
  `owner_type` STRING(255),
  `status` STRING(255),
  `status_text` STRING(255),
  `archived` BOOL,
  `public` STRING(255)
)
INSERT INTO `out_project`
SELECT
  `p`.`id` AS `project_id`,
  `p`.`name` AS `project`,
  replace(LEFT(`pd`.`created_at`, 19), 'T', ' ') AS `created_at`,
  `pd`.`due_date` AS `due_date`,
  `w`.`name` AS `workspace`,
  'https://app.asana.com/0/' || `p`.`id` || '/board' AS `url`,
  COALESCE(`u`.`user`, 'Unknown') AS `owner`,
  `u`.`user_type` AS `owner_type`,
  `pd`.`current_status_color` AS `status`,
  IF(
    LENGTH(`pd`.`current_status_text`) > 1024,
    LEFT(`pd`.`current_status_text`, 1021) || '...',
    `pd`.`current_status_text`
  ) AS `status_text`,
  IF(`pd`.`archived` = '1', 'true', 'false') AS `archived`,
  IF(`pd`.`public` = '1', 'true', 'false') AS `public`
FROM `projects` AS `p`
LEFT JOIN `workspaces` AS `w`
  ON `p`.`parent_id` = `w`.`id`
LEFT JOIN `projects_details` AS `pd`
  ON `p`.`id` = `pd`.`id`
LEFT JOIN `out_user` AS `u`
  ON `pd`.`owner_id` = `u`.`user_id`
/* create N:M relation table describing user membership in projects */
CREATE TABLE `out_project_user` (
  `user_id` STRING(255) NOT NULL,
  `project_id` STRING(255) NOT NULL
)
INSERT INTO `out_project_user`
SELECT
  COALESCE(`u`.`user_id`, '0') AS `user_id`,
  `op`.`project_id`
FROM `projects_members` AS `pm`
INNER JOIN `out_project` AS `op`
  ON `pm`.`projects_details_pk` = `op`.`project_id`
LEFT JOIN `out_user` AS `u`
  ON `pm`.`id` = `u`.`user_id`
/* snapshot project table to be able to track progress in time */ /* this table is an auxiliary table which will be used for creating final snapshot table later on */ /* set timezone to UTC (change accordingly) */
ALTER SESSION
    SET TIMEZONE = 'UTC'
CREATE TABLE `out_project_snapshot` (
  `snapshot_date` DATE NOT NULL,
  `project_id` STRING(255) NOT NULL,
  `project` STRING(255),
  `created_at` DATETIME,
  `due_date` STRING(255),
  `workspace` STRING(255),
  `url` STRING(1024),
  `owner` STRING(255),
  `owner_type` STRING(255),
  `status` STRING(255),
  `status_text` STRING(255),
  `archived` BOOL,
  `public` STRING(255)
)
INSERT INTO `out_project_snapshot`
SELECT
  CAST(CURRENT_DATE AS STRING) AS `snapshot_date`,
  `op`.*
FROM `out_project` AS `op`