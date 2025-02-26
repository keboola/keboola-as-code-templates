/* create output table with opportunities */ /* change timestamps to date */ /* if there is no amount set, place 0 instead of empty value */ /* check referential integrity with employees and companies */ /* change boolean values to commonly used format in KBC scaffolds */
CREATE TABLE `out_opportunity` (
  `opportunity_id` STRING(2000) NOT NULL,
  `company_id` STRING(2000),
  `employee_id` STRING(2000),
  `opportunity` STRING(255),
  `date_created` DATE,
  `date_closed` DATE,
  `is_closed` STRING(255),
  `is_won` STRING(255),
  `pipeline` STRING(255),
  `stage` STRING(255),
  `stage_order` STRING(255),
  `opportunity_type` STRING(255),
  `opportunity_value` FLOAT64,
  `currency` STRING(255),
  `lead_source` STRING(255),
  `probability` FLOAT64
);

INSERT INTO `out_opportunity`
SELECT
  `d`.`deal_id` AS `opportunity_id`,
  COALESCE(`c`.`company_id`, '0') AS `company_id`,
  COALESCE(`e`.`employee_id`, '0') AS `employee_id`,
  `d`.`deal_title` AS `opportunity`,
  CAST(LEFT(`d`.`add_time`, 10) AS DATE) AS `date_created`,
  CAST(LEFT(`d`.`close_time`, 10) AS DATE) AS `date_closed`,
  IF(`d`.`close_time` = '', 'No', 'Yes') AS `is_closed`,
  IF(`d`.`deal_status` = 'won', 'Yes', 'No') AS `is_won`,
  `p`.`pipeline_name` AS `pipeline`,
  `s`.`stage_name` AS `stage`,
  COALESCE(`s`.`order_nr`, '0') AS `stage_order`,
  '' AS `opportunity_type`,
  IF(`d`.`deal_value` = '', '0.0', `d`.`deal_value`) AS `opportunity_value`,
  `d`.`deal_currency` AS `currency`,
  '' AS `lead_source`,
  `s`.`deal_probability` AS `probability`
FROM `deals` AS `d`
LEFT JOIN `out_company` AS `c`
  ON `d`.`org_id` = `c`.`company_id`
LEFT JOIN `pipelines` AS `p`
  ON `d`.`pipeline_id` = `p`.`pipeline_id`
LEFT JOIN `stages` AS `s`
  ON `d`.`stage_id` = `s`.`stage_id`
LEFT JOIN `out_employee` AS `e`
  ON `d`.`owner_id` = `e`.`employee_id`
WHERE
  `deal_deleted` = '';

/* set timezone to UTC (!!!CHANGE ACCORDINGLY TO YOUR REGION!!!) */
ALTER SESSION
    SET TIMEZONE = 'UTC';

/* create snapshot of the output table to track changes throughout time */ /* snapshot will be used in another transformation where it will be adjusted for a better final analysis */
CREATE TABLE `out_opportunity_snapshot` (
  `snapshot_date` DATE NOT NULL,
  `opportunity_id` STRING(2000) NOT NULL,
  `company_id` STRING(2000),
  `employee_id` STRING(2000),
  `opportunity` STRING(255),
  `date_created` DATE,
  `date_closed` DATE,
  `is_closed` STRING(255),
  `is_won` STRING(255),
  `pipeline` STRING(255),
  `stage` STRING(255),
  `stage_order` STRING(255),
  `opportunity_type` STRING(255),
  `opportunity_value` FLOAT64,
  `currency` STRING(255),
  `lead_source` STRING(255),
  `probability` FLOAT64
);

INSERT INTO `out_opportunity_snapshot`
SELECT
  CURRENT_DATE AS `snapshot_date`,
  `o`.*
FROM `out_opportunity` AS `o`;

/* fake row to keep referential integrity if child tables are missing existing opportunity ids */ /* adding row after snapshot, so we're not unnecessary snapshoting it */
INSERT INTO `out_opportunity` (
  `opportunity_id`,
  `company_id`,
  `employee_id`,
  `opportunity`,
  `is_closed`,
  `is_won`,
  `pipeline`,
  `stage`,
  `stage_order`,
  `opportunity_value`,
  `currency`
)
VALUES
  ('0', '0', '0', 'Unknown', 'No', 'No', '', '', '0', '0.0', 'USD');