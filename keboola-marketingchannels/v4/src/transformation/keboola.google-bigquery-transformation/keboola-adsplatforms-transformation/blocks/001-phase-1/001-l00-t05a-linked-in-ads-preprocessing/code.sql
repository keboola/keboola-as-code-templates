/* LINKEDIN PREPROCESSING */
CREATE OR REPLACE TABLE `linkedin_ads_basic_stats` AS
SELECT
  CONCAT_WS(
    '|',
    ABS.`start_year`,
    ABS.`start_month`,
    ABS.`start_day`,
    ABS.`end_year`,
    ABS.`end_month`,
    ABS.`end_day`
  ) AS `pk_date`,
  ABS.`pivot`,
  ABS.`pivotValue`,
  CONCAT_WS('|', `pk_date`, `pivot`, `pivotValue`) AS `pk`,
  DATE(
    CAST(ABS.`start_year` AS INT64),
    CAST(ABS.`start_month` AS INT64),
    CAST(ABS.`start_day` AS INT64)
  ) AS `start_date`,
  DATE(ABS.`end_year`, ABS.`end_month`, ABS.`end_day`) AS `end_date`,
  IF(`pivot` = 'CAMPAIGN', `pivotValue`, 'N/A') AS `campaign_id`,
  IF(`pivot` = 'CAMPAIGN_GROUP', `pivotValue`, 'N/A') AS `campaign_group_id`, /* ads_basic_stats */
  ABS.`follows`,
  ABS.`otherEngagements`,
  ABS.`reactions`,
  ABS.`impressions`,
  ABS.`clicks`,
  ABS.`totalEngagements`,
  ABS.`landingPageClicks`,
  ABS.`shares`,
  ABS.`comments`,
  ABS.`companyPageClicks`,
  ABS.`likes`,
  ABS.`commentLikes`
FROM `linkedinraw_ads_basic_stats` AS ABS;

CREATE OR REPLACE TABLE `linkedin_ads_cost` AS
SELECT
  CONCAT_WS(
    '|',
    AC.`start_year`,
    AC.`start_month`,
    AC.`start_day`,
    AC.`end_year`,
    AC.`end_month`,
    AC.`end_day`
  ) AS `pk_date`,
  AC.`pivot`,
  AC.`pivotValue`,
  CONCAT_WS('|', `pk_date`, `pivot`, `pivotValue`) AS `pk`,
  DATE(
    CAST(AC.`start_year` AS INT64),
    CAST(AC.`start_month` AS INT64),
    CAST(AC.`start_day` AS INT64)
  ) AS `start_date`,
  DATE(AC.`end_year`, AC.`end_month`, AC.`end_day`) AS `end_date`,
  IF(`pivot` = 'CAMPAIGN', `pivotValue`, 'N/A') AS `campaign_id`,
  IF(`pivot` = 'CAMPAIGN_GROUP', `pivotValue`, 'N/A') AS `campaign_group_id`,
  AC.`costInUsd`,
  AC.`conversionValueInLocalCurrency`,
  AC.`costInLocalCurrency`
FROM `linkedinraw_ads_cost` AS AC;

CREATE OR REPLACE TABLE `linkedin_campaigns` AS
SELECT
  'urn:li:sponsoredCampaign:' || `id` AS `campaign_id`,
  `targeting_locations`,
  `created`,
  `audienceExpansionEnabled`,
  `costType`,
  `dailyBudget`,
  `associatedEntity`,
  `lastModified`,
  `name`,
  `language`,
  `account`,
  `dailyBudget_currency`,
  `servingStatuses`,
  `campaignGroup`,
  `test`,
  `status`,
  `objectiveType`,
  `unitCost_amount`,
  `runSchedule`,
  `offsiteDeliveryEnabled`,
  `optimizationTargetType`,
  `version`,
  `type`,
  `unitCost_currencyCode`,
  `creativeSelection`
FROM `linkedinraw_campaigns`;