/* account table */
CREATE TABLE `companies_tmp` AS
SELECT
  STAR_MAP(*) AS `obj`
FROM `companies`
CREATE TABLE `out_companies` (
  `companyId` STRING(1024) NOT NULL,
  `name` STRING(255),
  `website` STRING(255),
  `createdate` DATE,
  `isDeleted` BOOL
)
INSERT INTO `out_companies`
SELECT
  TRIM(JSON_EXTRACT(`obj`, '$.companyId'), '"') AS `companyId`,
  TRIM(JSON_EXTRACT(`obj`, '$.name'), '"') AS `name`,
  TRIM(JSON_EXTRACT(`obj`, '$.website'), '"') AS `website`,
  NULLIF(TRIM(CAST(JSON_EXTRACT(`obj`, '$.createdate') AS DATE), '"'), '') AS `createdate`,
  TRIM(JSON_EXTRACT(`obj`, '$.isDeleted'), '"') AS `isDeleted`
FROM `companies_tmp`
/* contacts table */
CREATE TABLE `contacts_tmp` AS
SELECT
  STAR_MAP(*) AS `obj`
FROM `contacts`
CREATE TABLE `out_contacts` (
  `canonical_vid` STRING(1024) NOT NULL,
  `firstname` STRING(255),
  `lastname` STRING(255),
  `email` STRING(255),
  `createdate` DATE,
  `email_source` STRING(255),
  `associatedcompanyid` STRING(255),
  `lifecyclestage` STRING(255)
)
INSERT INTO `out_contacts`
SELECT
  TRIM(JSON_EXTRACT(`obj`, '$.canonical_vid'), '"') AS `canonical_vid`,
  TRIM(JSON_EXTRACT(`obj`, '$.firstname'), '"') AS `firstname`,
  TRIM(JSON_EXTRACT(`obj`, '$.lastname'), '"') AS `lastname`,
  TRIM(JSON_EXTRACT(`obj`, '$.email'), '"') AS `email`,
  NULLIF(TRIM(CAST(JSON_EXTRACT(`obj`, '$.createdate') AS DATE), '"'), '') AS `createdate`,
  TRIM(JSON_EXTRACT(`obj`, '$.email_source'), '"') AS `email_source`,
  TRIM(JSON_EXTRACT(`obj`, '$.associatedcompanyid'), '"') AS `associatedcompanyid`,
  TRIM(JSON_EXTRACT(`obj`, '$.lifecyclestage'), '"') AS `lifecyclestage`
FROM `contacts_tmp`
/* owners table */
CREATE TABLE `owners_tmp` AS
SELECT
  STAR_MAP(*) AS `obj`
FROM `owners`
CREATE TABLE `out_owners` (
  `ownerId` STRING(1024) NOT NULL,
  `firstName` STRING(255),
  `lastName` STRING(255),
  `email` STRING(255)
)
INSERT INTO `out_owners`
SELECT
  TRIM(JSON_EXTRACT(`obj`, '$.ownerId'), '"') AS `ownerId`,
  TRIM(JSON_EXTRACT(`obj`, '$.firstName'), '"') AS `firstName`,
  TRIM(JSON_EXTRACT(`obj`, '$.lastName'), '"') AS `lastName`,
  TRIM(JSON_EXTRACT(`obj`, '$.email'), '"') AS `email`
FROM `owners_tmp`
/* deals table */
CREATE TABLE `deals_tmp` AS
SELECT
  STAR_MAP(*) AS `obj`
FROM `deals`
CREATE TABLE `out_deals` (
  `dealId` STRING(1024) NOT NULL,
  `isDeleted` BOOL,
  `dealname` STRING(255),
  `createdate` DATE,
  `closedate` DATE,
  `dealtype` STRING(255),
  `amount` FLOAT64,
  `pipeline` STRING(255),
  `dealstage` STRING(255),
  `hubspot_owner_id` STRING(255),
  `hs_analytics_source` STRING(255)
)
INSERT INTO `out_deals`
SELECT
  TRIM(JSON_EXTRACT(`obj`, '$.dealId'), '"') AS `dealId`,
  TRIM(JSON_EXTRACT(`obj`, '$.isDeleted'), '"') AS `isDeleted`,
  TRIM(JSON_EXTRACT(`obj`, '$.dealname'), '"') AS `dealname`,
  NULLIF(TRIM(JSON_EXTRACT(`obj`, '$.createdate'), '"'), '') AS `createdate`,
  NULLIF(TRIM(JSON_EXTRACT(`obj`, '$.closedate'), '"'), '') AS `closedate`,
  TRIM(JSON_EXTRACT(`obj`, '$.dealtype'), '"') AS `dealtype`,
  NULLIF(TRIM(JSON_EXTRACT(`obj`, '$.amount'), '"'), '') AS `amount`,
  TRIM(JSON_EXTRACT(`obj`, '$.pipeline'), '"') AS `pipeline`,
  TRIM(JSON_EXTRACT(`obj`, '$.dealstage'), '"') AS `dealstage`,
  TRIM(JSON_EXTRACT(`obj`, '$.hubspot_owner_id'), '"') AS `hubspot_owner_id`,
  TRIM(JSON_EXTRACT(`obj`, '$.hs_analytics_source'), '"') AS `hs_analytics_source`
FROM `deals_tmp`
/* deals companies table */
CREATE TABLE `deals_companies_tmp` AS
SELECT
  STAR_MAP(*) AS `obj`
FROM `deals_assoc_companies_list`
CREATE TABLE `out_deals_companies` (
  `dealId` STRING(1024) NOT NULL,
  `associated_companyId` STRING(255) NOT NULL
)
INSERT INTO `out_deals_companies`
SELECT
  TRIM(JSON_EXTRACT(`obj`, '$.dealId'), '"') AS `dealId`,
  TRIM(JSON_EXTRACT(`obj`, '$.associated_companyId'), '"') AS `associated_companyId`
FROM `deals_companies_tmp`
/* pipelines table */
CREATE TABLE `pipelines_tmp` AS
SELECT
  STAR_MAP(*) AS `obj`
FROM `pipelines`
CREATE TABLE `out_pipelines` (
  `pipelineId` STRING(1024) NOT NULL,
  `label` STRING(255)
)
INSERT INTO `out_pipelines`
SELECT
  TRIM(JSON_EXTRACT(`obj`, '$.pipelineId'), '"') AS `pipelineId`,
  TRIM(JSON_EXTRACT(`obj`, '$.label'), '"') AS `label`
FROM `pipelines_tmp`
/* stages table */
CREATE TABLE `stages_tmp` AS
SELECT
  STAR_MAP(*) AS `obj`
FROM `pipeline_stages`
CREATE TABLE `out_stages` (
  `stageId` STRING(1024) NOT NULL,
  `label` STRING(255),
  `displayOrder` INT64,
  `probability` FLOAT64,
  `closedWon` BOOL
)
INSERT INTO `out_stages`
SELECT
  TRIM(JSON_EXTRACT(`obj`, '$.stageId'), '"') AS `stageId`,
  TRIM(JSON_EXTRACT(`obj`, '$.label'), '"') AS `label`,
  NULLIF(TRIM(JSON_EXTRACT(`obj`, '$.displayOrder'), '"'), '') AS `displayOrder`,
  NULLIF(TRIM(JSON_EXTRACT(`obj`, '$.probability'), '"'), '') AS `probability`,
  TRIM(JSON_EXTRACT(`obj`, '$.closedWon'), '"') AS `closedWon`
FROM `stages_tmp`
/* deals_contacts_list table */
CREATE TABLE `deals_contacts_list_tmp` AS
SELECT
  STAR_MAP(*) AS `obj`
FROM `deals_contacts_list`
CREATE TABLE `out_deals_contacts_list` (
  `contact_vid` STRING(1024) NOT NULL,
  `dealId` STRING(1024) NOT NULL
)
INSERT INTO `out_deals_contacts_list`
SELECT
  TRIM(JSON_EXTRACT(`obj`, '$.contact_vid'), '"') AS `contact_vid`,
  TRIM(JSON_EXTRACT(`obj`, '$.dealId'), '"') AS `dealId`
FROM `deals_contacts_list_tmp`
/* activities table */
CREATE TABLE `activities_tmp` AS
SELECT
  STAR_MAP(*) AS `obj`
FROM `activities`
CREATE TABLE `out_activities` (
  `engagement_id` STRING(1024) NOT NULL,
  `metadata_subject` STRING(2000),
  `engagement_createdAt` DATE,
  `metadata_durationMilliseconds` STRING(255),
  `associations_contactIds` STRING(255),
  `associations_dealIds` STRING(255),
  `associations_ownerIds` STRING(255)
)
INSERT INTO `out_activities`
SELECT
  TRIM(JSON_EXTRACT(`obj`, '$.engagement_id'), '"') AS `engagement_id`,
  TRIM(JSON_EXTRACT(`obj`, '$.metadata_subject'), '"') AS `metadata_subject`,
  NULLIF(TRIM(JSON_EXTRACT(`obj`, '$.engagement_createdAt'), '"'), '') AS `engagement_createdAt`,
  TRIM(JSON_EXTRACT(`obj`, '$.metadata_durationMilliseconds'), '"') AS `metadata_durationMilliseconds`,
  TRIM(JSON_EXTRACT(`obj`, '$.associations_contactIds'), '"') AS `associations_contactIds`,
  TRIM(JSON_EXTRACT(`obj`, '$.associations_dealIds'), '"') AS `associations_dealIds`,
  TRIM(JSON_EXTRACT(`obj`, '$.associations_ownerIds'), '"') AS `associations_ownerIds`
FROM `activities_tmp`