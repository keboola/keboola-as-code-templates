/* account table */
CREATE TABLE `out_account` (
  `Id` STRING(1024) NOT NULL,
  `IsDeleted` BOOL,
  `Name` STRING(255),
  `Website` STRING(255),
  `CreatedDate` STRING(255)
);

INSERT INTO `out_account`
SELECT
  `Id`,
  CAST(`IsDeleted` AS BOOL) AS `IsDeleted`,
  `Name`,
  `Website`,
  `CreatedDate`
FROM `account`;

/* contact table */
CREATE TABLE `out_contact` (
  `Id` STRING(1024) NOT NULL,
  `IsDeleted` BOOL,
  `Name` STRING(255),
  `Email` STRING(255),
  `CreatedDate` STRING(255),
  `LeadSource` STRING(255)
);

INSERT INTO `out_contact`
SELECT
  `Id`,
  CAST(`IsDeleted` AS BOOL) AS `IsDeleted`,
  `Name`,
  `Email`,
  `CreatedDate`,
  `LeadSource`
FROM `contact`;

/* lead table */
CREATE TABLE `out_lead` (
  `Id` STRING(1024) NOT NULL,
  `IsDeleted` BOOL,
  `Name` STRING(255),
  `Email` STRING(255),
  `CreatedDate` STRING(255),
  `LeadSource` STRING(255),
  `IsConverted` BOOL
);

INSERT INTO `out_lead`
SELECT
  `Id`,
  CAST(`IsDeleted` AS BOOL) AS `IsDeleted`,
  `Name`,
  `Email`,
  `CreatedDate`,
  `LeadSource`,
  CAST(`IsConverted` AS BOOL) AS `IsConverted`
FROM `lead`;

/* user table */
CREATE TABLE `out_user` (
  `Id` STRING(1024) NOT NULL,
  `Name` STRING(255),
  `Email` STRING(255),
  `Title` STRING(255)
);

INSERT INTO `out_user`
SELECT
  `Id`,
  `Name`,
  `Email`,
  `Title`
FROM `user`;

/* opportunity table */
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
);

INSERT INTO `out_opportunity`
SELECT
  `Id`,
  CAST(`IsDeleted` AS BOOL) AS `IsDeleted`,
  `AccountId`,
  `OwnerId`,
  `Name`,
  `CreatedDate`,
  `CloseDate`,
  CAST(`IsClosed` AS BOOL) AS `IsClosed`,
  CAST(`IsWon` AS BOOL) AS `IsWon`,
  `StageName`,
  `Type`,
  CAST(NULLIF(`Amount`, '') AS FLOAT64) AS `Amount`,
  '' AS `CurrencyIsoCode`,
  `LeadSource`,
  CAST(NULLIF(`Probability`, '') AS FLOAT64) AS `Probability`
FROM `opportunity`;

/* opportunitystage table */
CREATE TABLE `out_opportunitystage` (
  `Id` STRING(1024) NOT NULL,
  `MasterLabel` STRING(255),
  `SortOrder` INT64
);

INSERT INTO `out_opportunitystage`
SELECT
  `Id`,
  `MasterLabel`,
  CAST(NULLIF(SortOrder, '') AS INT64) AS `SortOrder`
FROM `opportunitystage`;

/* event table */
CREATE TABLE `out_event` (
  `Id` STRING(1024) NOT NULL,
  `IsDeleted` BOOL,
  `WhoId` STRING(255),
  `WhatId` STRING(255),
  `OwnerId` STRING(255),
  `Subject` STRING(1024),
  `ActivityDateTime` STRING(255),
  `DurationInMinutes` INT64
);

INSERT INTO `out_event`
SELECT
  `Id`,
  CAST(`IsDeleted` AS BOOL) AS `IsDeleted`,
  `WhoId`,
  `WhatId`,
  `OwnerId`,
  `Subject`,
  `ActivityDateTime`,
  CAST(NULLIF(`DurationInMinutes`, '') AS INT64) AS `DurationInMinutes`
FROM `event`;

/* opportunity contact role table */
CREATE TABLE `out_opportunitycontactrole` (
  `Id` STRING(1024) NOT NULL,
  `IsDeleted` BOOL,
  `OpportunityId` STRING(1024),
  `ContactId` STRING(1024),
  `IsPrimary` BOOL,
  `Role` STRING(255)
);

INSERT INTO `out_opportunitycontactrole`
SELECT
  `Id`,
  CAST(`IsDeleted` AS BOOL) AS `IsDeleted`,
  `OpportunityId`,
  `ContactId`,
  CAST(`IsPrimary` AS BOOL) AS `IsPrimary`,
  `Role`
FROM `opportunitycontactrole`;