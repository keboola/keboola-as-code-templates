/* activities table */
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
);

INSERT INTO `out_activities`
SELECT
  `activity_id`,
  `company_id`,
  `user_id`,
  `person_id`,
  `type`,
  `deal_id`,
  `subject`,
  CAST(`due_date` as DATE),
  CAST(`add_time` as DATETIME),
  `done`
FROM `activities`;

/* deals table */
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
);

INSERT INTO `out_deals`
SELECT
	`deal_id`,
  CAST(NULLIF(`deal_deleted`, '') AS INT64) AS `deal_deleted`,
  CAST(NULLIF(`lost_time`, '') AS DATETIME) AS `lost_time`,
  CAST(NULLIF(`add_time`, '') AS DATETIME) AS `add_time`,
  `deal_currency`,
  `deal_value`,
	`deal_status`,
  CAST(NULLIF(`close_time`, '') AS DATETIME) AS `close_time`,
  CAST(NULLIF(`products_count`, '') AS INT64) AS `products_count`,
  `person_id`,
  CAST(NULLIF(`stage_order_nr`, '') AS INT64) AS `stage_order_nr`,
  CAST(NULLIF(`won_time`, '') AS DATETIME) AS `won_time`,
  `deal_title`,
  `pipeline_id`,
  `org_id`,
  `owner_id`,
  CAST(NULLIF(`deal_active`, '') AS INT64) AS `deal_active`,
  CAST(NULLIF(`expected_close_date`, '') AS DATE) AS `expected_close_date`,
  `stage_id`,
  CAST(NULLIF(`activities_count`, '') AS INT64) AS `activities_count`,
  CAST(NULLIF(`email_messages_count`, '') AS INT64) AS `email_messages_count`,
  `lost_reason`
FROM `deals`;

/* organizations table */
CREATE TABLE `out_organizations` (
  `organization_id` STRING(1024) NOT NULL,
  `org_name` STRING(1024),
  `owner_id` STRING(1024),
  `org_address` STRING(1024),
  `fk_category_id` STRING(1024),
  `org_address_country` STRING(255),
  `org_address_postal_code` STRING(255),
  `org_add_date` DATE
);

INSERT INTO `out_organizations`
SELECT
  `organization_id`,
  `org_name`,
  `owner_id`,
  `org_address`,
  `fk_category_id`,
  `org_address_country`,
  `org_address_postal_code`,
  CAST(NULLIF(`org_add_date`, '') AS DATE) AS `org_add_date`
FROM `organizations`;

/* persons table */
CREATE TABLE `out_persons` (
  `contact_id` STRING(255) NOT NULL,
  `contact_name` STRING(255),
  `org_id` STRING(255),
  `add_time` DATETIME
);

INSERT INTO `out_persons`
SELECT
  `contact_id`,
  `contact_name`,
  `org_id`,
  CAST(NULLIF(`add_time`, '') AS DATETIME) AS `add_time`
FROM `persons`;

/* person emails table */
CREATE TABLE `out_person_emails` (
  `contact_id` STRING(255) NOT NULL,
  `label` STRING(255) NOT NULL,
  `value` STRING(255),
  `primary` INT64
);

INSERT INTO `out_person_emails`
SELECT
  `contact_id`,
  `label`,
  `value`,
  CAST(NULLIF(`primary`, '') AS INT64) AS `primary`
FROM `person_emails`;

/* pipelines table */
CREATE TABLE `out_pipelines` (
  `pipeline_id` STRING(1024) NOT NULL,
  `pipeline_name` STRING(255),
  `url_title` STRING(255),
  `order_nr` INT64,
  `active` INT64
);

INSERT INTO `out_pipelines`
SELECT
  `pipeline_id`,
  `pipeline_name`,
  `url_title`,
  CAST(NULLIF(`order_nr`, '') AS INT64) AS `order_nr`,
  CAST(NULLIF(`active`, '') AS INT64) AS `active`
FROM `pipelines`;

/* stages table */
CREATE TABLE `out_stages` (
  `stage_id` STRING(1024) NOT NULL,
  `order_nr` INT64,
  `stage_name` STRING(1024),
  `active_flag` INT64,
  `pipeline_id` STRING(1024),
  `deal_probability` INT64,
  `add_time` DATETIME
);

INSERT INTO `out_stages`
SELECT
  `stage_id`,
  CAST(NULLIF(`order_nr`, '') AS INT64) AS `order_nr`,
  `stage_name`,
  CAST(NULLIF(`active_flag`, '') AS INT64) AS `active_flag`,
  `pipeline_id`,
  CAST(NULLIF(`deal_probability`, '') AS INT64) AS `deal_probability`,
  CAST(NULLIF(`add_time`, '') AS DATETIME) AS `add_time`
FROM `stages`;

/* users table */
CREATE TABLE `out_users` (
  `owner_id` STRING(1024) NOT NULL,
  `owner_name` STRING(255),
  `owner_email` STRING(255)
);

INSERT INTO `out_users`
SELECT
  `owner_id`,
  `owner_name`,
  `owner_email`
FROM `users`;