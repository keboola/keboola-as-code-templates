/* create output table with contacts */
CREATE TABLE `out_contact` (
  `contact_id` STRING(2000) NOT NULL,
  `contact` STRING(255),
  `email` STRING(255),
  `contact_type` STRING(255),
  `date_created` DATE,
  `lead_source` STRING(255),
  `lead_converted` STRING(255)
)
INSERT INTO `out_contact`
SELECT
  `Id` AS `contact_id`,
  `Name` AS `contact`,
  `Email` AS `email`,
  'Contact' AS `contact_type`,
  IF(`CreatedDate` = '', NULL, CAST(`CreatedDate` AS DATE)) AS `date_created`,
  `LeadSource` AS `lead_source`,
  'Is Contact' AS `lead_converted`
FROM `contact`
WHERE
  LOWER(`IsDeleted`) = 'false'
UNION ALL
/* insert leads and mark if they are already converted */
SELECT
  `Id` AS `contact_id`,
  `Name` AS `contact`,
  `Email` AS `email`,
  'Lead' AS `contact_type`,
  IF(`CreatedDate` = '', NULL, CAST(`CreatedDate` AS DATE)) AS `date_created`,
  `LeadSource` AS `lead_source`,
  IF(`IsConverted` = 'false', 'No', 'Yes') AS `lead_converted`
FROM `lead`
WHERE
  LOWER(`IsDeleted`) = 'false'
/* fake row to keep referential integrity if child tables are missing existing contact ids */
INSERT INTO `out_contact` (
  `contact_id`,
  `contact`,
  `email`,
  `contact_type`,
  `date_created`,
  `lead_source`,
  `lead_converted`
)
VALUES
  ('0', 'Unknown', '', 'Lead', NULL, '', 'No')