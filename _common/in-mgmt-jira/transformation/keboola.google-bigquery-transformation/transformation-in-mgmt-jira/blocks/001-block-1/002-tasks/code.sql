/* create task table */
CREATE TABLE `out_task` (
  `task_id` STRING NOT NULL,
  `task` STRING,
  `section` STRING,
  `project_id` STRING,
  `created_at` STRING,
  `completed_at` STRING,
  `due_date` STRING,
  `days_past_due` INT64,
  `is_past_due` BOOL,
  `url` STRING,
  `assignee` STRING,
  `assignee_type` STRING,
  `completed` BOOL,
  `is_subtask` BOOL
)
INSERT INTO `out_task`
SELECT DISTINCT
  i.`id` AS `task_id`,
  i.`summary` AS `task`,
  i.`issue_type_name` AS `section`,
  p.`id` AS `project_id`,
  replace(LEFT(i.`created`, 19), 'T', ' ') AS `created_at`,
  replace(LEFT(i.`resolution_date`, 19), 'T', ' ') AS `completed_at`,
  `due_date`,
  IF(
    i.`resolution_date` <> NULL,
    NULL,
    DATE_DIFF(CURRENT_DATE, NULLIF(i.`due_date`, ''), DAY)
  ) AS `days_past_due`,
  IF(`days_past_due` IS NULL OR `days_past_due` < 1, FALSE, TRUE) AS `is_past_due`,
  NULL AS `url`,
  i.`assignee_display_name` AS `assignee`,
  u.`account_type` AS `assignee_type`,
  IF(i.`resolution_date` = '', FALSE, TRUE) AS `completed`,
  IF(i.`parent_id` = '', FALSE, TRUE) AS `is_subtask`
FROM `issues` AS i
LEFT JOIN `projects` AS p
  ON i.`project_key` = p.`key`
LEFT JOIN `users` AS u
  ON i.`reporter_account_id` = u.`account_id`
/* creates table with details in custom field of every task */
CREATE TABLE `out_task_custom_field` (
  `task_custom_field_id` STRING NOT NULL,
  `task_id` STRING,
  `task_custom_field` STRING,
  `task_custom_field_value` STRING
)
INSERT INTO `out_task_custom_field`
SELECT
  CONCAT(i.`id`, json.key) AS `task_custom_field_id`,
  i.`id` AS `task_id`,
  json.key AS `task_custom_field`,
  CAST(json.value AS STRING) AS `task_custom_field_value`
FROM `issues` AS i, TABLE(EXPLODE(PARSE_JSON(`custom_fields`))) AS json
WHERE
  NOT json.value LIKE '' AND NOT json.value LIKE '[]' AND NOT json.value LIKE '{}'
/* create task_event table */
CREATE TABLE `out_task_event` (
  `task_event_id` STRING NOT NULL,
  `task_id` STRING,
  `user_id` STRING,
  `user_type` STRING,
  `user` STRING,
  `created_at` DATETIME,
  `event_type` STRING,
  `event` STRING,
  `event_text` STRING
)
INSERT INTO `out_task_event`
SELECT
  c.`id` AS `task_event_id`,
  c.`issue_id` AS `task_id`,
  COALESCE(u.`account_id`, '0') AS `user_id`,
  u.`account_type` AS `user_type`,
  u.`display_name` AS `user`,
  replace(LEFT(c.`created`, 19), 'T', ' ') AS `created_at`,
  c.`field_type` AS `event_type`,
  c.`field` AS `event`,
  i.`description` AS `event_text`
FROM `issues-changelogs` AS c
LEFT JOIN `users` AS u
  ON u.`account_id` = c.`author_account_id`
LEFT JOIN `issues` AS i
  ON i.`id` = c.`issue_id`
/* create task_tag table */
CREATE TABLE `out_task_tag` (
  `task_id` STRING NOT NULL,
  `tag` STRING NOT NULL
)
INSERT INTO `out_task_tag`
SELECT DISTINCT
  `id` AS `task_id`,
  `labels` AS `tag`
FROM `issues` AS i
WHERE
  `labels` <> '[]'
/* create join table of users and tasks */
CREATE TABLE `out_task_user` (
  `user_id` STRING NOT NULL,
  `task_id` STRING NOT NULL
)
INSERT INTO `out_task_user`
SELECT
  i.`reporter_account_id` AS `user_id`,
  i.`id` AS `task_id`
FROM `issues` AS i