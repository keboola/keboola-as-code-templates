/* create temporary table for additional calculations */ /* add previous values of pipeline, stage and value, so we can define if there has been any change */
CREATE TABLE `opportunity_snapshot_tmp` AS
SELECT
  `opportunity_id`,
  `snapshot_date`,
  `employee_id`,
  `company_id`,
  `pipeline`,
  COALESCE(
    LAG(`pipeline`) OVER (PARTITION BY `opportunity_id` ORDER BY `snapshot_date`),
    `pipeline`
  ) AS `previous_pipeline`,
  `stage`,
  `stage_order`,
  COALESCE(
    LAG(`stage`) OVER (PARTITION BY `opportunity_id` ORDER BY `snapshot_date`),
    `stage`
  ) AS `previous_stage`,
  COALESCE(
    LAG(`stage_order`) OVER (PARTITION BY `opportunity_id` ORDER BY `snapshot_date`),
    `stage_order`
  ) AS `previous_stage_order`,
  `opportunity_value`,
  COALESCE(
    LAG(`opportunity_value`) OVER (PARTITION BY `opportunity_id` ORDER BY `snapshot_date`),
    `opportunity_value`
  ) AS `previous_opportunity_value`,
  `probability`,
  COALESCE(
    LAG(`probability`) OVER (PARTITION BY `opportunity_id` ORDER BY `snapshot_date`),
    `probability`
  ) AS `previous_probability`
FROM `opportunity_snapshot`;

/* create opportunity snapshot table */ /* define if there has been change of pipeline, stage or value */
CREATE TABLE `out_opportunity_snapshot` (
  `opportunity_id` STRING(2000) NOT NULL,
  `snapshot_date` DATE NOT NULL,
  `employee_id` STRING(2000),
  `company_id` STRING(2000),
  `pipeline` STRING(255),
  `previous_pipeline` STRING(255),
  `pipeline_change` STRING(255),
  `stage` STRING(255),
  `stage_order` INT64,
  `previous_stage` STRING(255),
  `previous_stage_order` INT64,
  `stage_change` STRING(255),
  `opportunity_value` FLOAT64,
  `previous_opportunity_value` FLOAT64,
  `opportunity_value_change` STRING(255),
  `probability` FLOAT64,
  `previous_probability` FLOAT64,
  `probability_change` STRING(255),
  `max_date_in_month` BOOL
);

INSERT INTO `out_opportunity_snapshot`
SELECT
  `s`.`opportunity_id`,
  `s`.`snapshot_date`,
  `s`.`employee_id`,
  `s`.`company_id`,
  `s`.`pipeline`,
  `s`.`previous_pipeline`,
  IF(`s`.`pipeline` <> `s`.`previous_pipeline`, 'Yes', 'No') AS `pipeline_change`,
  `s`.`stage`,
  `s`.`stage_order`,
  `s`.`previous_stage`,
  `s`.`previous_stage_order`,
  IF(`s`.`stage` <> `s`.`previous_stage`, 'Yes', 'No') AS `stage_change`,
  `s`.`opportunity_value`,
  `s`.`previous_opportunity_value`,
  IF(`s`.`opportunity_value` <> `s`.`previous_opportunity_value`, 'Yes', 'No') AS `opportunity_value_change`,
  `s`.`probability`,
  `s`.`previous_probability`,
  IF(`s`.`probability` <> `s`.`previous_probability`, 'Yes', 'No') AS `probability_change`,
  IF(`m`.`max_date_in_month` IS NULL, 'false', 'true') AS `max_date_in_month`
FROM `opportunity_snapshot_tmp` AS `s`
LEFT JOIN (
  SELECT
    `opportunity_id`,
    LEFT(`snapshot_date`, 7) AS `month`,
    MAX(`snapshot_date`) AS `max_date_in_month`
  FROM `opportunity_snapshot_tmp`
  GROUP BY
    1,
    2
) AS `m`
  ON `s`.`opportunity_id` = `m`.`opportunity_id`
  AND `s`.`snapshot_date` = `m`.`max_date_in_month`;