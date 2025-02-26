/* create output table with companies */ /* cast timestamp to date */
CREATE TABLE `out_company` (
  `company_id` STRING(2000) NOT NULL,
  `company` STRING(255),
  `website` STRING(2000),
  `date_created` DATE
);

INSERT INTO `out_company`
SELECT DISTINCT
  `Id` AS `company_id`,
  `Name` AS `company`,
  `Website` AS `website`,
  IF(`CreatedDate` = '', NULL, CAST(`CreatedDate` AS DATE)) AS `date_created`
FROM `account`
WHERE
  LOWER(`IsDeleted`) = 'false';

/* fake row to keep referential integrity if child tables are missing existing company ids */
INSERT INTO `out_company` (
  `company_id`,
  `company`,
  `website`,
  `date_created`
)
VALUES
  ('0', 'Unknown', '', NULL);