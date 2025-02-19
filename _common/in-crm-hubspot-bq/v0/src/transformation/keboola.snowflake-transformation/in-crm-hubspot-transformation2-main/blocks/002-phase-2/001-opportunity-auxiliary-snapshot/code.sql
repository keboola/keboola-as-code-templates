/* create output table with opportunities */ /* cast timestamps to human-readable date format */ /* if there is no amount set, place 0 instead of empty value */ /* opportunities with stage label 'closed won' are marked as won */ /* check referential integrity with employees and companies */
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
)
INSERT INTO `out_opportunity`
SELECT
  `d`.`dealId` AS `opportunity_id`,
  COALESCE(`c`.`company_id`, '0') AS `company_id`,
  COALESCE(`e`.`employee_id`, '0') AS `employee_id`,
  `d`.`dealname` AS `opportunity`,
  NULLIF(CAST(`d`.`createdate` AS STRING), '') AS `date_created`,
  NULLIF(CAST(`d`.`createdate` AS STRING), '') AS `date_closed`,
  IF(CAST(`d`.`closedate` AS STRING) = '', 'No', 'Yes') AS `is_closed`,
  IF(CAST(`s`.`closedWon` AS STRING) = 'True', 'Yes', 'No') AS `is_won`,
  `p`.`label` AS `pipeline`,
  `s`.`label` AS `stage`,
  `s`.`displayOrder` AS `stage_order`,
  `d`.`dealtype` AS `opportunity_type`,
  CAST((
    IF(CAST(`d`.`amount` AS STRING) = '', 0, `d`.`amount`)
  ) AS FLOAT64) AS `opportunity_value`,
  '' AS `currency`,
  `d`.`hs_analytics_source` AS `lead_source`,
  NULLIF(CAST(`s`.`probability` AS STRING), '') AS `probability`
FROM `deals` AS `d`
LEFT JOIN `pipelines` AS `p`
  ON `d`.`pipeline` = `p`.`pipelineId`
LEFT JOIN `stages` AS `s`
  ON `d`.`dealstage` = `s`.`stageId`
LEFT JOIN `out_employee` AS `e`
  ON `d`.`hubspot_owner_id` = `e`.`employee_id`
LEFT JOIN `deals_companies` AS `dc`
  ON `d`.`dealId` = `dc`.`dealId`
LEFT JOIN `out_company` AS `c`
  ON `dc`.`associated_companyId` = `c`.`company_id`
WHERE
  LOWER(`d`.`isDeleted`) = 'false'
/* set timezone to UTC (!!!CHANGE ACCORDINGLY TO YOUR REGION!!!) */
ALTER SESSION
    SET TIMEZONE = 'UTC'
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
)
INSERT INTO `out_opportunity_snapshot`
SELECT
  CURRENT_DATE AS `snapshot_date`,
  `o`.*
FROM `out_opportunity` AS `o`
/* fake row to keep referential integrity if child tables are missing existing opportunity ids */ /* adding row after snapshot, so we're not unnecessary snapshoting it */
INSERT INTO `out_opportunity` (
  `opportunity_id`,
  `company_id`,
  `employee_id`,
  `opportunity`,
  `date_created`,
  `date_closed`,
  `is_closed`,
  `is_won`,
  `pipeline`,
  `stage`,
  `opportunity_type`,
  `opportunity_value`,
  `currency`,
  `lead_source`,
  `probability`
)
VALUES
  (
    '0',
    '0',
    '0',
    'Unknown',
    NULL,
    NULL,
    'No',
    'No',
    '',
    '',
    '',
    '0.0',
    '',
    '',
    NULL
  )