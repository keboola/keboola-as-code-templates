/* TASK SNAPSHOTS */ /* snapshot task table to be able to track progress in time */ /* this table is an auxiliary table which will be used for creating final snapshot table later on */ /* set timezone to UTC (change accordingly) */
ALTER SESSION
    SET TIMEZONE = 'UTC'
CREATE TABLE `tmp1_task_snapshot` AS
SELECT
  CAST(CURRENT_DATE AS STRING) AS `snapshot_date`,
  `ot`.*
FROM `out_task` AS `ot`
/* create temporary table for additional calculations */ /* add previous values of due date, assignee and section, so we can define if there has been any change */ /* don't snapshot tasks of already archived projects (using inner join on project snapshot tmp table) */
CREATE TABLE `tmp2_task_snapshot` AS
SELECT
  `ts`.`task_id`,
  `ts`.`snapshot_date`,
  NULLIF(CAST(`ts`.`due_date` AS STRING), '') AS `due_date`,
  NULLIF(
    LAG(CAST(`ts`.`due_date` AS STRING)) OVER (PARTITION BY `ts`.`task_id` ORDER BY `ts`.`snapshot_date`),
    ''
  ) AS `previous_due_date`,
  `ts`.`completed`,
  COALESCE(
    LAG(CAST(`ts`.`completed` AS STRING)) OVER (PARTITION BY `ts`.`task_id` ORDER BY `ts`.`snapshot_date`),
    ''
  ) AS `previous_completed`,
  `ts`.`section`,
  COALESCE(
    LAG(CAST(`ts`.`section` AS STRING)) OVER (PARTITION BY `ts`.`task_id` ORDER BY `ts`.`snapshot_date`),
    ''
  ) AS `previous_section`,
  `ts`.`assignee`,
  COALESCE(
    LAG(CAST(`ts`.`assignee` AS STRING)) OVER (PARTITION BY `ts`.`task_id` ORDER BY `ts`.`snapshot_date`),
    ''
  ) AS `previous_assignee`
FROM `tmp1_task_snapshot` AS `ts`
INNER JOIN (
  SELECT DISTINCT
    `project_id`
  FROM `tmp2_project_snapshot`
) AS `ps`
  ON `ts`.`project_id` = `ps`.`project_id`
/* marking last day of month/quarter and last snapshot for reporting */
CREATE TABLE `tmp3_task_snapshot` AS
SELECT
  `t`.*,
  IF(`m`.`max_date` IS NULL, 'false', 'true') AS `last_snapshot`,
  IF(`lm`.`task_id` IS NULL, 'false', 'true') AS `last_day_of_month`,
  IF(`lq`.`task_id` IS NULL, 'false', 'true') AS `last_day_of_quarter`
FROM `tmp2_task_snapshot` AS `t`
LEFT JOIN (
  SELECT
    MAX(`snapshot_date`) AS `max_date`
  FROM `tmp2_task_snapshot`
) AS `m`
  ON `t`.`snapshot_date` = `m`.`max_date`
LEFT JOIN (
  SELECT
    `s`.`task_id`,
    `s`.`snapshot_date`
  FROM `tmp2_task_snapshot` AS `s`
  LEFT JOIN (
    SELECT
      MAX(`snapshot_date`) AS `max_date`
    FROM `tmp2_task_snapshot`
  ) AS `m`
    ON `s`.`snapshot_date` = `m`.`max_date`
  WHERE
    `s`.`snapshot_date` = LAST_DAY(CAST(`s`.`snapshot_date` AS DATE))
    OR NOT `m`.`max_date` IS NULL
) AS `lm`
  ON `t`.`task_id` = `lm`.`task_id` AND `t`.`snapshot_date` = `lm`.`snapshot_date`
LEFT JOIN (
  SELECT
    `s`.`task_id`,
    `s`.`snapshot_date`
  FROM `tmp2_task_snapshot` AS `s`
  LEFT JOIN (
    SELECT
      MAX(`snapshot_date`) AS `max_date`
    FROM `tmp2_task_snapshot`
  ) AS `m`
    ON `s`.`snapshot_date` = `m`.`max_date`
  WHERE
    `s`.`snapshot_date` = LAST_DAY(CAST(`s`.`snapshot_date` AS DATE), QUARTER)
    OR NOT `m`.`max_date` IS NULL
) AS `lq`
  ON `t`.`task_id` = `lq`.`task_id` AND `t`.`snapshot_date` = `lq`.`snapshot_date`
/* create task snapshot table */ /* define if there has been change of section, assignee or due date */
CREATE TABLE `out_task_snapshot` (
  `task_id` STRING NOT NULL,
  `snapshot_date` DATE NOT NULL,
  `section` STRING,
  `previous_section` STRING,
  `section_change` BOOL,
  `due_date` DATE,
  `previous_due_date` DATE,
  `due_date_change` BOOL,
  `due_date_diff` INT64,
  `assignee` STRING,
  `previous_assignee` STRING,
  `assignee_change` BOOL,
  `last_snapshot` BOOL,
  `last_day_of_month` BOOL,
  `last_day_of_quarter` BOOL
)
INSERT INTO `out_task_snapshot`
SELECT
  `o`.`task_id`,
  `o`.`snapshot_date`,
  `o`.`section`,
  `o`.`previous_section`,
  IF(`o`.`section` <> `o`.`previous_section`, 'true', 'false') AS `section_change`,
  `o`.`due_date`,
  `o`.`previous_due_date`,
  IF(`o`.`due_date` <> `o`.`previous_due_date`, 'true', 'false') AS `due_date_change`,
  DATE_DIFF(`o`.`due_date`, `o`.`previous_due_date`, DAY) AS `due_date_diff`,
  `o`.`assignee`,
  `o`.`previous_assignee`,
  IF(`o`.`assignee` <> `o`.`previous_assignee`, 'true', 'false') AS `assignee_change`,
  `o`.`last_snapshot`,
  `o`.`last_day_of_month`,
  `o`.`last_day_of_quarter`
FROM `tmp3_task_snapshot` AS `o`