/* creating output table with tasks */ /* date to simple format */ /* change boolean values to true/false */ /* add section from membership table */
CREATE TABLE `out_task` (
  `task_id` STRING(255) NOT NULL,
  `task` STRING(255),
  `section` STRING(255),
  `project_id` STRING(255),
  `created_at` DATETIME,
  `completed_at` DATETIME,
  `due_date` DATE,
  `days_past_due` STRING(255),
  `is_past_due` BOOL,
  `url` STRING(1024),
  `assignee` STRING(255),
  `assignee_type` STRING(255),
  `completed` BOOL,
  `is_subtask` BOOL
);

INSERT INTO `out_task`
SELECT DISTINCT
  `t`.`id` AS `task_id`,
  IF(LENGTH(`t`.`name`) > 1024, LEFT(`t`.`name`, 1021) || '...', `t`.`name`) AS `task`,
  COALESCE(`tdm`.`section_name`, '(no section)') AS `section`,
  `p`.`project_id` AS `project_id`,
  NULLIF(replace(RIGHT(replace(LEFT(`td`.`created_at`, 19), 'T', ' '), 1), 'Z', ''), '') AS `created_at`,
  NULLIF(replace(RIGHT(replace(LEFT(`td`.`completed_at`, 19), 'T', ' '), 1), 'Z', ''), '') AS `completed_at`,
  NULLIF(`td`.`due_on`, '') AS `due_date`,
  IF(
    `td`.`completed` = '1',
    NULL,
    DATE_DIFF(CURRENT_DATE, NULLIF(`td`.`due_on`, ''), DAY)
  ) AS `days_past_due`,
  IF(`days_past_due` IS NULL OR `days_past_due` < 1, 'false', 'true') AS `is_past_due`,
  'https://app.asana.com/0/' || `p`.`project_id` || '/' || `t`.`id` AS `url`,
  COALESCE(`u`.`user`, 'Unknown') AS `assignee`,
  `u`.`user_type` AS `assignee_type`,
  IF(`td`.`completed` = '1', 'true', 'false') AS `completed`,
  IF(`td`.`parent_id` = '', 'false', 'true') AS `is_subtask`
FROM `project` AS `p`
INNER JOIN `tasks` AS `t`
  ON `p`.`project_id` = `t`.`project_id`
LEFT JOIN `task_details` AS `td`
  ON `t`.`id` = `td`.`id`
LEFT JOIN `task_details_memberships` AS `tdm`
  ON `p`.`project_id` = `tdm`.`project_id` AND `t`.`id` = `tdm`.`task_details_pk`
LEFT JOIN `user` AS `u`
  ON `td`.`assignee_id` = `u`.`user_id`;

/* table with custom task fields */ /* choose correct value column based on type of the field */
CREATE TABLE `out_task_custom_field` (
  `task_custom_field_id` STRING(255) NOT NULL,
  `task_id` STRING(255),
  `task_custom_field` STRING(255),
  `task_custom_field_value` STRING(255)
);

INSERT INTO `out_task_custom_field`
SELECT
  `id` AS `task_custom_field_id`,
  `task_details_pk` AS `task_id`,
  `name` AS `task_custom_field`,
  IF(`type` = 'enum', `enum_value_name`, `number_value`) AS `task_custom_field_value`
FROM `task_details-custom_fields`;

/* table with tags assigned to task */
CREATE TABLE `out_task_tag` (
  `task_id` STRING(255) NOT NULL,
  `tag` STRING(255) NOT NULL
);

INSERT INTO `out_task_tag`
SELECT
  `ot`.`task_id` AS `task_id`,
  `tdt`.`name` AS `tag`
FROM `out_task` AS `ot`
INNER JOIN `task_details_tags` AS `tdt`
  ON `ot`.`task_id` = `tdt`.`task_details_pk`;

/* create N:M relation table describing user membership in tasks */
CREATE TABLE `out_task_user` (
  `user_id` STRING(255) NOT NULL,
  `task_id` STRING(255) NOT NULL
);

INSERT INTO `out_task_user`
SELECT
  `tdf`.`id` AS `user_id`,
  `ot`.`task_id` AS `task_id`
FROM `task_details_followers` AS `tdf`
INNER JOIN `out_task` AS `ot`
  ON `tdf`.`task_details_pk` = `ot`.`task_id`;

/* table with task events */ /* trim text if it's too long */
CREATE TABLE `out_task_event` (
  `task_event_id` STRING(255) NOT NULL,
  `task_id` STRING(255),
  `user_id` STRING(255),
  `user_type` STRING(255),
  `user` STRING(255),
  `created_at` DATETIME,
  `event_type` STRING(255),
  `event` STRING(255),
  `event_text` STRING(1024)
);

INSERT INTO `out_task_event`
SELECT
  `id` AS `task_event_id`,
  `task_id`,
  COALESCE(`u`.`user_id`, '0') AS `user_id`,
  `u`.`user_type`,
  COALESCE(`u`.`user`, 'Unknown') AS `user`,
  NULLIF(replace(LEFT(`created_at`, 19), 'T', ' '), '') AS `created_at`,
  `type` AS `event_type`,
  `resource_subtype` AS `event`,
  IF(LENGTH(`text`) > 1024, LEFT(`text`, 1021) || '...', `text`) AS `event_text`
FROM `task_stories` AS `ts`
LEFT JOIN `user` AS `u`
  ON `ts`.`created_by_id` = `u`.`user_id`;

/* snapshot task table to be able to track progress in time */ /* this table is an auxiliary table which will be used for creating final snapshot table later on */ /* set timezone to UTC (change accordingly) */
ALTER SESSION
    SET TIMEZONE = 'UTC';

CREATE TABLE `out_task_snapshot` (
  `snapshot_date` DATE NOT NULL,
  `task_id` STRING(255) NOT NULL,
  `task` STRING(255),
  `section` STRING(255),
  `project_id` STRING(255),
  `created_at` DATETIME,
  `completed_at` DATETIME,
  `due_date` DATE,
  `days_past_due` STRING(255),
  `is_past_due` BOOL,
  `url` STRING(1024),
  `assignee` STRING(255),
  `assignee_type` STRING(255),
  `completed` BOOL,
  `is_subtask` BOOL
);

INSERT INTO `out_task_snapshot`
SELECT
  CURRENT_DATE AS `snapshot_date`,
  `task_id`,
  `task`,
  `section`,
  `project_id`,
  `created_at`,
  `completed_at`,
  `due_date`,
  `days_past_due`,
  `is_past_due`,
  `url`,
  `assignee`,
  `assignee_type`,
  `completed`,
  `is_subtask`
FROM `out_task`;