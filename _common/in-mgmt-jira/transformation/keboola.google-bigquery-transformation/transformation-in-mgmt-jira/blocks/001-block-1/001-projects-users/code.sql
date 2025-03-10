/* create projects table */
CREATE TABLE `out_project` (
  `project_id` STRING NOT NULL,
  `project` STRING,
  `created_at` STRING,
  `due_date` STRING,
  `workspace` STRING,
  `url` STRING,
  `owner` STRING,
  `owner_type` STRING,
  `status` STRING,
  `status_text` STRING,
  `archived` BOOL,
  `public` BOOL
);

INSERT INTO `out_project`
SELECT
  p.`id` AS `project_id`,
  p.`name` AS `project`,
  NULL AS `created_at`,
  NULL AS `due_date`,
  NULL AS `workspace`,
  NULL AS `url`,
  NULL AS `owner`,
  NULL AS `owner_type`,
  NULL AS `status`,
  NULL AS `status_text`,
  IF(p.`archived` = 'True', TRUE, FALSE) AS `archived`,
  IF(p.`is_private` = TRUE, FALSE, TRUE) AS `public`
FROM `projects` AS p;

/* creates table of users */
CREATE TABLE `out_user` (
  `user_id` STRING NOT NULL,
  `user` STRING,
  `email` STRING,
  `email_domain` STRING,
  `user_type` STRING
);

INSERT INTO `out_user`
SELECT
  `account_id` AS `user_id`,
  `display_name` AS `user`,
  `email_address` AS `email`,
  SPLIT_PART(`email_address`, '@', 2) AS `email_domain`,
  `account_type` AS `user_type`
FROM `users`;

/* create join table of users working on a project */
CREATE TABLE `out_project_user` (
  `user_id` STRING NOT NULL,
  `project_id` STRING NOT NULL
);

INSERT INTO `out_project_user`
SELECT DISTINCT
  c.`author_account_id` AS `user_id`,
  p.`id` AS `project_id`
FROM `issues-changelogs` AS c
LEFT JOIN `issues` AS i
  ON i.`id` = c.`issue_id`
LEFT JOIN `projects` AS p
  ON p.`key` = i.`project_key`;