/* create output table with companies */
CREATE TABLE `out_company` (
  `company_id` STRING(2000) NOT NULL,
  `company` STRING(255),
  `website` STRING(255),
  `date_created` DATE
);

/* cast timestamp to date */
INSERT INTO `out_company`
SELECT DISTINCT
  `organization_id` AS `company_id`,
  `org_name` AS `company`,
  '' AS `website`,
  CAST(NULLIF(`org_add_date`,'') AS DATE) AS `date_created`
FROM `organizations`;

/* fake row to keep referential integrity if child tables are missing existing company ids */
INSERT INTO `out_company` (
  `company_id`,
  `company`,
  `website`,
  `date_created`
)
VALUES
  ('0', 'Unknown', '', NULL);