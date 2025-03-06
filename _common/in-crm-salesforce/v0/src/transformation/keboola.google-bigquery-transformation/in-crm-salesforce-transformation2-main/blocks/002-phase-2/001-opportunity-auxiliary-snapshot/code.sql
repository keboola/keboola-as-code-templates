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
  `o`.`Id` AS `opportunity_id`,
  COALESCE(`c`.`company_id`, '0') AS `company_id`,
  COALESCE(`e`.`employee_id`, '0') AS `employee_id`,
  `o`.`Name` AS `opportunity`,
  CAST(NULLIF(LEFT(`o`.`CreatedDate`, 10), '') AS DATE) AS `date_created`,
  CAST(NULLIF(`o`.`CloseDate`, '') AS DATE) AS `date_closed`,
  IF(`o`.`IsClosed` = 'false', 'No', 'Yes') AS `is_closed`,
  IF(`o`.`IsWon` = 'false', 'No', 'Yes') AS `is_won`,
  'N/A in Salesforce' AS `pipeline`,
  `o`.`StageName` AS `stage`,
  COALESCE(`s`.`SortOrder`, '0') AS `stage_order`,
  `o`.`Type` AS `opportunity_type`,
  CAST(`o`.`Amount` AS FLOAT64) AS `opportunity_value`,
  `o`.`CurrencyIsoCode` AS `currency`,
  `o`.`LeadSource` AS `lead_source`,
  CAST(`o`.`Probability` AS FLOAT64) AS `probability`
FROM `opportunity` AS `o`
LEFT JOIN `out_company` AS `c`
  ON `o`.`AccountId` = `c`.`company_id`
LEFT JOIN `out_employee` AS `e`
  ON `o`.`OwnerId` = `e`.`employee_id`
LEFT JOIN `opportunity_stage` AS `s`
  ON `o`.`StageName` = `s`.`MasterLabel`
WHERE
  LOWER(`IsDeleted`) = 'false';

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
  opportunity_id,
  company_id,
  employee_id,
  opportunity,
  date_created,
  date_closed,
  is_closed,
  is_won,
  pipeline,
  stage,
  stage_order,
  opportunity_type,
  opportunity_value,
  currency,
  lead_source,
  probability
)
VALUES
  ('0', '0', '0', 'Unknown', NULL, NULL, 'No', 'No', NULL, NULL, '0', NULL, 0.0, 'USD', NULL, 0.0);