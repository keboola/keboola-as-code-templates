/* account table */
CREATE TABLE `account_tmp` AS
SELECT
  STAR_MAP(*) AS `obj`
FROM `account`
CREATE TABLE `out_account` (
  `Id` STRING(1024) NOT NULL,
  `IsDeleted` BOOL,
  `Name` STRING(255),
  `Website` STRING(255),
  `CreatedDate` STRING(255)
)
INSERT INTO `out_account`
SELECT
  TRIM(JSON_EXTRACT(`obj`, '$.Id'), '"') AS `Id`,
  TRIM(JSON_EXTRACT(`obj`, '$.IsDeleted'), '"') AS `IsDeleted`,
  TRIM(JSON_EXTRACT(`obj`, '$.Name'), '"') AS `Name`,
  TRIM(JSON_EXTRACT(`obj`, '$.Website'), '"') AS `Website`,
  TRIM(JSON_EXTRACT(`obj`, '$.CreatedDate'), '"') AS `CreatedDate`
FROM `account_tmp`
/* contact table */
CREATE TABLE `contact_tmp` AS
SELECT
  STAR_MAP(*) AS `obj`
FROM `contact`
CREATE TABLE `out_contact` (
  `Id` STRING(1024) NOT NULL,
  `IsDeleted` BOOL,
  `Name` STRING(255),
  `Email` STRING(255),
  `CreatedDate` STRING(255),
  `LeadSource` STRING(255)
)
INSERT INTO `out_contact`
SELECT
  TRIM(JSON_EXTRACT(`obj`, '$.Id'), '"') AS `Id`,
  TRIM(JSON_EXTRACT(`obj`, '$.IsDeleted'), '"') AS `IsDeleted`,
  TRIM(JSON_EXTRACT(`obj`, '$.Name'), '"') AS `Name`,
  TRIM(JSON_EXTRACT(`obj`, '$.Email'), '"') AS `Email`,
  TRIM(JSON_EXTRACT(`obj`, '$.CreatedDate'), '"') AS `CreatedDate`,
  TRIM(JSON_EXTRACT(`obj`, '$.LeadSource'), '"') AS `LeadSource`
FROM `contact_tmp`
/* lead table */
CREATE TABLE `lead_tmp` AS
SELECT
  STAR_MAP(*) AS `obj`
FROM `lead`
CREATE TABLE `out_lead` (
  `Id` STRING(1024) NOT NULL,
  `IsDeleted` BOOL,
  `Name` STRING(255),
  `Email` STRING(255),
  `CreatedDate` STRING(255),
  `LeadSource` STRING(255),
  `IsConverted` BOOL
)
INSERT INTO `out_lead`
SELECT
  TRIM(JSON_EXTRACT(`obj`, '$.Id'), '"') AS `Id`,
  TRIM(JSON_EXTRACT(`obj`, '$.IsDeleted'), '"') AS `IsDeleted`,
  TRIM(JSON_EXTRACT(`obj`, '$.Name'), '"') AS `Name`,
  TRIM(JSON_EXTRACT(`obj`, '$.Email'), '"') AS `Email`,
  TRIM(JSON_EXTRACT(`obj`, '$.CreatedDate'), '"') AS `CreatedDate`,
  TRIM(JSON_EXTRACT(`obj`, '$.LeadSource'), '"') AS `LeadSource`,
  TRIM(JSON_EXTRACT(`obj`, '$.IsConverted'), '"') AS `IsConverted`
FROM `lead_tmp`
/* user table */
CREATE TABLE `user_tmp` AS
SELECT
  STAR_MAP(*) AS `obj`
FROM `user`
CREATE TABLE `out_user` (
  `Id` STRING(1024) NOT NULL,
  `Name` STRING(255),
  `Email` STRING(255),
  `Title` STRING(255)
)
INSERT INTO `out_user`
SELECT
  TRIM(JSON_EXTRACT(`obj`, '$.Id'), '"') AS `Id`,
  TRIM(JSON_EXTRACT(`obj`, '$.Name'), '"') AS `Name`,
  TRIM(JSON_EXTRACT(`obj`, '$.Email'), '"') AS `Email`,
  TRIM(JSON_EXTRACT(`obj`, '$.Title'), '"') AS `Title`
FROM `user_tmp`
/* opportunity table */
CREATE TABLE `opportunity_tmp` AS
SELECT
  STAR_MAP(*) AS `obj`
FROM `opportunity`
CREATE TABLE `out_opportunity` (
  `Id` STRING(1024) NOT NULL,
  `IsDeleted` BOOL,
  `AccountId` STRING(1024),
  `OwnerId` STRING(1024),
  `Name` STRING(255),
  `CreatedDate` STRING(255),
  `CloseDate` STRING(255),
  `IsClosed` BOOL,
  `IsWon` BOOL,
  `StageName` STRING(255),
  `Type` STRING(255),
  `Amount` FLOAT64,
  `CurrencyIsoCode` STRING(255),
  `LeadSource` STRING(255),
  `Probability` FLOAT64
)
INSERT INTO `out_opportunity`
SELECT
  TRIM(JSON_EXTRACT(`obj`, '$.Id'), '"') AS `Id`,
  TRIM(JSON_EXTRACT(`obj`, '$.IsDeleted'), '"') AS `IsDeleted`,
  TRIM(JSON_EXTRACT(`obj`, '$.AccountId'), '"') AS `AccountId`,
  TRIM(JSON_EXTRACT(`obj`, '$.OwnerId'), '"') AS `OwnerId`,
  TRIM(JSON_EXTRACT(`obj`, '$.Name'), '"') AS `Name`,
  TRIM(JSON_EXTRACT(`obj`, '$.CreatedDate'), '"') AS `CreatedDate`,
  TRIM(JSON_EXTRACT(`obj`, '$.CloseDate'), '"') AS `CloseDate`,
  TRIM(JSON_EXTRACT(`obj`, '$.IsClosed'), '"') AS `IsClosed`,
  TRIM(JSON_EXTRACT(`obj`, '$.IsWon'), '"') AS `IsWon`,
  TRIM(JSON_EXTRACT(`obj`, '$.StageName'), '"') AS `StageName`,
  TRIM(JSON_EXTRACT(`obj`, '$.Type'), '"') AS `Type`,
  NULLIF(TRIM(JSON_EXTRACT(`obj`, '$.Amount'), '"'), '') AS `Amount`,
  TRIM(JSON_EXTRACT(`obj`, '$.CurrencyIsoCode'), '"') AS `CurrencyIsoCode`,
  TRIM(JSON_EXTRACT(`obj`, '$.LeadSource'), '"') AS `LeadSource`,
  NULLIF(TRIM(JSON_EXTRACT(`obj`, '$.Probability'), '"'), '') AS `Probability`
FROM `opportunity_tmp`
/* opportunitystage table */
CREATE TABLE `opportunitystage_tmp` AS
SELECT
  STAR_MAP(*) AS `obj`
FROM `opportunitystage`
CREATE TABLE `out_opportunitystage` (
  `Id` STRING(1024) NOT NULL,
  `MasterLabel` STRING(255),
  `SortOrder` INT64
)
INSERT INTO `out_opportunitystage`
SELECT
  TRIM(JSON_EXTRACT(`obj`, '$.Id'), '"') AS `Id`,
  TRIM(JSON_EXTRACT(`obj`, '$.MasterLabel'), '"') AS `MasterLabel`,
  NULLIF(TRIM(JSON_EXTRACT(`obj`, '$.SortOrder'), '"'), '') AS `SortOrder`
FROM `opportunitystage_tmp`
/* event table */
CREATE TABLE `event_tmp` AS
SELECT
  STAR_MAP(*) AS `obj`
FROM `event`
CREATE TABLE `out_event` (
  `Id` STRING(1024) NOT NULL,
  `IsDeleted` BOOL,
  `WhoId` STRING(255),
  `WhatId` STRING(255),
  `OwnerId` STRING(255),
  `Subject` STRING(1024),
  `ActivityDateTime` STRING(255),
  `DurationInMinutes` INT64
)
INSERT INTO `out_event`
SELECT
  TRIM(JSON_EXTRACT(`obj`, '$.Id'), '"') AS `Id`,
  TRIM(JSON_EXTRACT(`obj`, '$.IsDeleted'), '"') AS `IsDeleted`,
  TRIM(JSON_EXTRACT(`obj`, '$.WhoId'), '"') AS `WhoId`,
  TRIM(JSON_EXTRACT(`obj`, '$.WhatId'), '"') AS `WhatId`,
  TRIM(JSON_EXTRACT(`obj`, '$.OwnerId'), '"') AS `OwnerId`,
  TRIM(JSON_EXTRACT(`obj`, '$.Subject'), '"') AS `Subject`,
  TRIM(JSON_EXTRACT(`obj`, '$.ActivityDateTime'), '"') AS `ActivityDateTime`,
  NULLIF(TRIM(JSON_EXTRACT(`obj`, '$.DurationInMinutes'), '"'), '') AS `DurationInMinutes`
FROM `event_tmp`
/* opportunity contact role table */
CREATE TABLE `opportunitycontactrole_tmp` AS
SELECT
  STAR_MAP(*) AS `obj`
FROM `opportunitycontactrole`
CREATE TABLE `out_opportunitycontactrole` (
  `Id` STRING(1024) NOT NULL,
  `IsDeleted` BOOL,
  `OpportunityId` STRING(1024),
  `ContactId` STRING(1024),
  `IsPrimary` BOOL,
  `Role` STRING(255)
)
INSERT INTO `out_opportunitycontactrole`
SELECT
  TRIM(JSON_EXTRACT(`obj`, '$.Id'), '"') AS `Id`,
  TRIM(JSON_EXTRACT(`obj`, '$.IsDeleted'), '"') AS `IsDeleted`,
  TRIM(JSON_EXTRACT(`obj`, '$.OpportunityId'), '"') AS `OpportunityId`,
  TRIM(JSON_EXTRACT(`obj`, '$.ContactId'), '"') AS `ContactId`,
  TRIM(JSON_EXTRACT(`obj`, '$.IsPrimary'), '"') AS `IsPrimary`,
  TRIM(JSON_EXTRACT(`obj`, '$.Role'), '"') AS `Role`
FROM `opportunitycontactrole_tmp`