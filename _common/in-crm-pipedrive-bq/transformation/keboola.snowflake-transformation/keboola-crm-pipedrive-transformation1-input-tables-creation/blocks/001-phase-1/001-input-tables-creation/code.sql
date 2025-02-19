/* activities table */
CREATE TABLE `activities_tmp` AS
SELECT
  STAR_MAP(*) AS `obj`
FROM `activities`
CREATE TABLE `out_activities` (
  `activity_id` STRING(1024) NOT NULL,
  `company_id` STRING(1024),
  `user_id` STRING(1024),
  `person_id` STRING(1024),
  `type` STRING(255),
  `deal_id` STRING(1024),
  `subject` STRING(1024),
  `due_date` DATE,
  `add_time` DATETIME,
  `done` STRING(1024)
)
INSERT INTO `out_activities`
SELECT
  TRIM(JSON_EXTRACT(`obj`, '$.activity_id'), '"') AS `activity_id`,
  TRIM(JSON_EXTRACT(`obj`, '$.company_id'), '"') AS `company_id`,
  TRIM(JSON_EXTRACT(`obj`, '$.user_id'), '"') AS `user_id`,
  TRIM(JSON_EXTRACT(`obj`, '$.person_id'), '"') AS `person_id`,
  TRIM(JSON_EXTRACT(`obj`, '$.type'), '"') AS `type`,
  TRIM(JSON_EXTRACT(`obj`, '$.deal_id'), '"') AS `deal_id`,
  TRIM(JSON_EXTRACT(`obj`, '$.subject'), '"') AS `subject`,
  TRIM(JSON_EXTRACT(`obj`, '$.due_date'), '"') AS `due_date`,
  TRIM(JSON_EXTRACT(`obj`, '$.add_time'), '"') AS `add_time`,
  TRIM(JSON_EXTRACT(`obj`, '$.done'), '"') AS `done`
FROM `activities_tmp`
/* deals table */
CREATE TABLE `deals_tmp` AS
SELECT
  STAR_MAP(*) AS `obj`
FROM `deals`
CREATE TABLE `out_deals` (
  `deal_id` STRING(1024) NOT NULL,
  `deal_deleted` INT64,
  `lost_time` DATETIME,
  `add_time` DATETIME,
  `deal_currency` STRING(255),
  `deal_value` STRING(255),
  `deal_status` STRING(1024),
  `close_time` DATETIME,
  `products_count` INT64,
  `person_id` STRING(255),
  `stage_order_nr` INT64,
  `won_time` DATETIME,
  `deal_title` STRING(1024),
  `pipeline_id` STRING(1024),
  `org_id` STRING(1024),
  `owner_id` STRING(1024),
  `deal_active` INT64,
  `expected_close_date` DATE,
  `stage_id` STRING(1024),
  `activities_count` INT64,
  `email_messages_count` INT64,
  `lost_reason` STRING(1024)
)
INSERT INTO `out_deals`
SELECT
  TRIM(JSON_EXTRACT(`obj`, '$.deal_id'), '"') AS `deal_id`,
  NULLIF(TRIM(JSON_EXTRACT(`obj`, '$.deal_deleted'), '"'), '') AS `deal_deleted`,
  NULLIF(TRIM(JSON_EXTRACT(`obj`, '$.lost_time'), '"'), '') AS `lost_time`,
  NULLIF(TRIM(JSON_EXTRACT(`obj`, '$.add_time'), '"'), '') AS `add_time`,
  TRIM(JSON_EXTRACT(`obj`, '$.deal_currency'), '"') AS `deal_currency`,
  TRIM(JSON_EXTRACT(`obj`, '$.deal_value'), '"') AS `deal_value`,
  TRIM(JSON_EXTRACT(`obj`, '$.deal_status'), '"') AS `deal_status`,
  NULLIF(TRIM(JSON_EXTRACT(`obj`, '$.close_time'), '"'), '') AS `close_time`,
  NULLIF(TRIM(JSON_EXTRACT(`obj`, '$.products_count'), '"'), '') AS `products_count`,
  TRIM(JSON_EXTRACT(`obj`, '$.person_id'), '"') AS `person_id`,
  NULLIF(TRIM(JSON_EXTRACT(`obj`, '$.stage_order_nr'), '"'), '') AS `stage_order_nr`,
  NULLIF(TRIM(JSON_EXTRACT(`obj`, '$.won_time'), '"'), '') AS `won_time`,
  TRIM(JSON_EXTRACT(`obj`, '$.deal_title'), '"') AS `deal_title`,
  TRIM(JSON_EXTRACT(`obj`, '$.pipeline_id'), '"') AS `pipeline_id`,
  TRIM(JSON_EXTRACT(`obj`, '$.org_id'), '"') AS `org_id`,
  TRIM(JSON_EXTRACT(`obj`, '$.owner_id'), '"') AS `owner_id`,
  NULLIF(TRIM(JSON_EXTRACT(`obj`, '$.deal_active'), '"'), '') AS `deal_active`,
  NULLIF(TRIM(JSON_EXTRACT(`obj`, '$.expected_close_date'), '"'), '') AS `expected_close_date`,
  TRIM(JSON_EXTRACT(`obj`, '$.stage_id'), '"') AS `stage_id`,
  NULLIF(TRIM(JSON_EXTRACT(`obj`, '$.activities_count'), '"'), '') AS `activities_count`,
  NULLIF(TRIM(JSON_EXTRACT(`obj`, '$.email_messages_count'), '"'), '') AS `email_messages_count`,
  TRIM(JSON_EXTRACT(`obj`, '$.lost_reason'), '"') AS `lost_reason`
FROM `deals_tmp`
/* organizations table */
CREATE TABLE `organizations_tmp` AS
SELECT
  STAR_MAP(*) AS `obj`
FROM `organizations`
CREATE TABLE `out_organizations` (
  `organization_id` STRING(1024) NOT NULL,
  `org_name` STRING(1024),
  `owner_id` STRING(1024),
  `org_address` STRING(1024),
  `fk_category_id` STRING(1024),
  `org_address_country` STRING(255),
  `org_address_postal_code` STRING(255),
  `org_add_date` DATE
)
INSERT INTO `out_organizations`
SELECT
  TRIM(JSON_EXTRACT(`obj`, '$.organization_id'), '"') AS `organization_id`,
  TRIM(JSON_EXTRACT(`obj`, '$.org_name'), '"') AS `org_name`,
  TRIM(JSON_EXTRACT(`obj`, '$.owner_id'), '"') AS `owner_id`,
  TRIM(JSON_EXTRACT(`obj`, '$.org_address'), '"') AS `org_address`,
  TRIM(JSON_EXTRACT(`obj`, '$.fk_category_id'), '"') AS `fk_category_id`,
  TRIM(JSON_EXTRACT(`obj`, '$.org_address_country'), '"') AS `org_address_country`,
  TRIM(JSON_EXTRACT(`obj`, '$.org_address_postal_code'), '"') AS `org_address_postal_code`,
  NULLIF(TRIM(JSON_EXTRACT(`obj`, '$.org_add_date'), '"'), '') AS `org_add_date`
FROM `organizations_tmp`
/* persons table */
CREATE TABLE `persons_tmp` AS
SELECT
  STAR_MAP(*) AS `obj`
FROM `persons`
CREATE TABLE `out_persons` (
  `contact_id` STRING(255) NOT NULL,
  `contact_name` STRING(255),
  `org_id` STRING(255),
  `add_time` DATETIME
)
INSERT INTO `out_persons`
SELECT
  TRIM(JSON_EXTRACT(`obj`, '$.contact_id'), '"') AS `contact_id`,
  TRIM(JSON_EXTRACT(`obj`, '$.contact_name'), '"') AS `contact_name`,
  TRIM(JSON_EXTRACT(`obj`, '$.org_id'), '"') AS `org_id`,
  NULLIF(TRIM(JSON_EXTRACT(`obj`, '$.add_time'), '"'), '') AS `add_time`
FROM `persons_tmp`
/* person emails table */
CREATE TABLE `person_emails_tmp` AS
SELECT
  STAR_MAP(*) AS `obj`
FROM `person_emails`
CREATE TABLE `out_person_emails` (
  `contact_id` STRING(255) NOT NULL,
  `label` STRING(255) NOT NULL,
  `value` STRING(255),
  `primary` INT64
)
INSERT INTO `out_person_emails`
SELECT
  TRIM(JSON_EXTRACT(`obj`, '$.contact_id'), '"') AS `contact_id`,
  TRIM(JSON_EXTRACT(`obj`, '$.label'), '"') AS `label`,
  TRIM(JSON_EXTRACT(`obj`, '$.value'), '"') AS `value`,
  NULLIF(TRIM(JSON_EXTRACT(`obj`, '$.primary'), '"'), '') AS `primary`
FROM `person_emails_tmp`
/* pipelines table */
CREATE TABLE `pipelines_tmp` AS
SELECT
  STAR_MAP(*) AS `obj`
FROM `pipelines`
CREATE TABLE `out_pipelines` (
  `pipeline_id` STRING(1024) NOT NULL,
  `pipeline_name` STRING(255),
  `url_title` STRING(255),
  `order_nr` INT64,
  `active` INT64
)
INSERT INTO `out_pipelines`
SELECT
  TRIM(JSON_EXTRACT(`obj`, '$.pipeline_id'), '"') AS `pipeline_id`,
  TRIM(JSON_EXTRACT(`obj`, '$.pipeline_name'), '"') AS `pipeline_name`,
  TRIM(JSON_EXTRACT(`obj`, '$.url_title'), '"') AS `url_title`,
  NULLIF(TRIM(JSON_EXTRACT(`obj`, '$.order_nr'), '"'), '') AS `order_nr`,
  NULLIF(TRIM(JSON_EXTRACT(`obj`, '$.active'), '"'), '') AS `active`
FROM `pipelines_tmp`
/* stages table */
CREATE TABLE `stages_tmp` AS
SELECT
  STAR_MAP(*) AS `obj`
FROM `stages`
CREATE TABLE `out_stages` (
  `stage_id` STRING(1024) NOT NULL,
  `order_nr` INT64,
  `stage_name` STRING(1024),
  `active_flag` INT64,
  `pipeline_id` STRING(1024),
  `deal_probability` INT64,
  `add_time` DATETIME
)
INSERT INTO `out_stages`
SELECT
  TRIM(JSON_EXTRACT(`obj`, '$.stage_id'), '"') AS `stage_id`,
  NULLIF(TRIM(JSON_EXTRACT(`obj`, '$.order_nr'), '"'), '') AS `order_nr`,
  TRIM(JSON_EXTRACT(`obj`, '$.stage_name'), '"') AS `stage_name`,
  NULLIF(TRIM(JSON_EXTRACT(`obj`, '$.active_flag'), '"'), '') AS `active_flag`,
  TRIM(JSON_EXTRACT(`obj`, '$.pipeline_id'), '"') AS `pipeline_id`,
  NULLIF(TRIM(JSON_EXTRACT(`obj`, '$.deal_probability'), '"'), '') AS `deal_probability`,
  NULLIF(TRIM(JSON_EXTRACT(`obj`, '$.add_time'), '"'), '') AS `add_time`
FROM `stages_tmp`
/* users table */
CREATE TABLE `users_tmp` AS
SELECT
  STAR_MAP(*) AS `obj`
FROM `users`
CREATE TABLE `out_users` (
  `owner_id` STRING(1024) NOT NULL,
  `owner_name` STRING(255),
  `owner_email` STRING(255)
)
INSERT INTO `out_users`
SELECT
  TRIM(JSON_EXTRACT(`obj`, '$.owner_id'), '"') AS `owner_id`,
  TRIM(JSON_EXTRACT(`obj`, '$.owner_name'), '"') AS `owner_name`,
  TRIM(JSON_EXTRACT(`obj`, '$.owner_email'), '"') AS `owner_email`
FROM `users_tmp`