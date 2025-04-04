/* PROJECT SNAPSHOTS */ /* snapshot project table to be able to track progress in time */ /* this table is an auxiliary table which will be used for creating final snapshot table later on */ /* set timezone to UTC (change accordingly) */
ALTER SESSION
    SET TIMEZONE = 'UTC';

CREATE TABLE `tmp1_project_snapshot` AS
SELECT
  CAST(CURRENT_DATE AS STRING) AS `snapshot_date`,
  `op`.*
FROM `out_project` AS `op`;

/* create temporary table for additional calculations */ /* add previous values of due date, owner and status, so we can define if there has been any change */ /* don't snapshot already archived projects */
CREATE TABLE `tmp2_project_snapshot` AS
SELECT
  `project_id`,
  `snapshot_date`,
  NULLIF(`due_date`, '') AS `due_date`,
  NULLIF(LAG(`due_date`) OVER (PARTITION BY `project_id` ORDER BY `snapshot_date`), '') AS `previous_due_date`,
  `status`,
  ROW_NUMBER() OVER (PARTITION BY `project_id`, `status` ORDER BY `snapshot_date` NULLS LAST) AS `days_in_status`,
  COALESCE(LAG(`status`) OVER (PARTITION BY `project_id` ORDER BY `snapshot_date`), '') AS `previous_status`,
  `status_text`,
  COALESCE(LAG(`status_text`) OVER (PARTITION BY `project_id` ORDER BY `snapshot_date`), '') AS `previous_status_text`,
  `owner`,
  COALESCE(LAG(`owner`) OVER (PARTITION BY `project_id` ORDER BY `snapshot_date`), '') AS `previous_owner`
FROM `tmp1_project_snapshot`
WHERE
  `archived` = 'false';

/* add partition column to tmp table for assigning number of day in the previous status and other possible calculations */ /* marking last day of month/quarter last snapshot for reporting */
CREATE TABLE `tmp3_project_snapshot` AS
SELECT
  `t`.*,
  IF(`m`.`max_date` IS NULL, 'false', 'true') AS `last_snapshot`,
  IF(`lm`.`project_id` IS NULL, 'false', 'true') AS `last_day_of_month`,
  IF(`lq`.`project_id` IS NULL, 'false', 'true') AS `last_day_of_quarter`,
  SUM(CASE WHEN `t`.`status` = `t`.`previous_status` THEN 0 ELSE 1 END) OVER (PARTITION BY `t`.`project_id` ORDER BY `t`.`snapshot_date`) AS `continuous_status_partition`
FROM `tmp2_project_snapshot` AS `t`
LEFT JOIN (
  SELECT
    MAX(`snapshot_date`) AS `max_date`
  FROM `tmp2_project_snapshot`
) AS `m`
  ON `t`.`snapshot_date` = `m`.`max_date`
LEFT JOIN (
  SELECT
    `s`.`project_id`,
    `s`.`snapshot_date`
  FROM `tmp2_project_snapshot` AS `s`
  LEFT JOIN (
    SELECT
      MAX(`snapshot_date`) AS `max_date`
    FROM `tmp2_project_snapshot`
  ) AS `m`
    ON `s`.`snapshot_date` = `m`.`max_date`
  WHERE
    `s`.`snapshot_date` = LAST_DAY(CAST(`s`.`snapshot_date` AS DATE))
    OR NOT `m`.`max_date` IS NULL
) AS `lm`
  ON `t`.`project_id` = `lm`.`project_id`
  AND `t`.`snapshot_date` = `lm`.`snapshot_date`
LEFT JOIN (
  SELECT
    `s`.`project_id`,
    `s`.`snapshot_date`
  FROM `tmp2_project_snapshot` AS `s`
  LEFT JOIN (
    SELECT
      MAX(`snapshot_date`) AS `max_date`
    FROM `tmp2_project_snapshot`
  ) AS `m`
    ON `s`.`snapshot_date` = `m`.`max_date`
  WHERE
    `s`.`snapshot_date` = LAST_DAY(CAST(`s`.`snapshot_date` AS DATE), QUARTER)
    OR NOT `m`.`max_date` IS NULL
) AS `lq`
  ON `t`.`project_id` = `lq`.`project_id`
  AND `t`.`snapshot_date` = `lq`.`snapshot_date`;

/* create project snapshot table */ /* define if there has been change of status, owner or due date */ /* adding number of days in previous stage */ /* iff project is moved more than once to some status, it always assign number of all days in that previous particular status */
CREATE TABLE `out_project_snapshot` (
  `project_id` STRING NOT NULL,
  `snapshot_date` DATE NOT NULL,
  `status` STRING,
  `status_text` STRING,
  `days_in_status` INT64,
  `previous_status` STRING,
  `status_change` BOOL,
  `days_in_previous_status` INT64,
  `due_date` STRING,
  `previous_due_date` DATE,
  `due_date_change` BOOL,
  `due_date_diff` STRING,
  `owner` STRING,
  `previous_owner` STRING,
  `owner_change` BOOL,
  `last_snapshot` BOOL,
  `last_day_of_month` BOOL,
  `last_day_of_quarter` BOOL
);

INSERT INTO `out_project_snapshot`
SELECT
  `o`.`project_id`,
  `o`.`snapshot_date`,
  `o`.`status`,
  `o`.`status_text`,
  `o`.`days_in_status`,
  `o`.`previous_status`,
  IF(`o`.`status` <> `o`.`previous_status`, 'true', 'false') AS `status_change`,
  `d`.`days_in_previous_status`,
  `o`.`due_date`,
  `o`.`previous_due_date`,
  IF(`o`.`due_date` <> `o`.`previous_due_date`, 'true', 'false') AS `due_date_change`,
  DATE_DIFF(`o`.`due_date`, `o`.`previous_due_date`, DAY) AS `due_date_diff`,
  `o`.`owner`,
  `o`.`previous_owner`,
  IF(`o`.`owner` <> `o`.`previous_owner`, 'true', 'false') AS `owner_change`,
  `o`.`last_snapshot`,
  `o`.`last_day_of_month`,
  `o`.`last_day_of_quarter`
FROM `tmp3_project_snapshot` AS `o`
LEFT JOIN (
  SELECT
    `project_id`,
    `continuous_status_partition`,
    `continuous_status_partition` + 1 AS `following_partition`,
    `status`,
    MAX(`days_in_status`) AS `days_in_previous_status`
  FROM `tmp3_project_snapshot`
  GROUP BY
    1,
    2,
    3,
    4
) AS `d`
  ON `o`.`project_id` = `d`.`project_id`
  AND `o`.`continuous_status_partition` = `d`.`following_partition`;