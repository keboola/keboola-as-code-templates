/* facebook ads source data */
CREATE TABLE `bdm_marketing_campaign_costs` (
  `MARKETING_CAMPAIGN_COSTS_ID` STRING NOT NULL,
  `SOURCE` STRING,
  `DATE` DATE,
  `CAMPAIGN` STRING,
  `IMPRESSIONS` INT64,
  `CLICKS` INT64,
  `COST` FLOAT64
);

INSERT INTO `bdm_marketing_campaign_costs`
SELECT
  `date_start` || '-' || 'FacebookAds' || '-' || `ad_name` AS `MARKETING_CAMPAIGN_COSTS_ID`,
  'Facebook' AS `SOURCE`,
  CAST(`date_start` AS DATE) AS `DATE`,
  `ad_name` AS `CAMPAIGN`,
  SUM(`impressions`) AS `IMPRESSIONS`,
  SUM(`clicks`) AS `CLICKS`,
  SUM(`spend`) AS `COST`
FROM `facebook_ads_insights_last_90d_insights`
GROUP BY
  1,
  2,
  3,
  4;

/* facebook ads source data grouped by month */
CREATE TABLE `bdm_marketing_campaign_costs_monthly` (
  `MARKETING_CAMPAIGN_COSTS_ID` STRING NOT NULL,
  `SOURCE` STRING,
  `DATE` DATE,
  `CAMPAIGN` STRING,
  `IMPRESSIONS` INT64,
  `CLICKS` INT64,
  `COST` FLOAT64
);

INSERT INTO `bdm_marketing_campaign_costs_monthly`
SELECT
  `date_start` || '-' || 'FacebookAds' || '-' || `ad_name` AS `MARKETING_CAMPAIGN_COSTS_ID`,
  'Facebook' AS `SOURCE`,
  CAST(`date_start` AS DATE) AS `DATE`,
  `ad_name` AS `CAMPAIGN`,
  SUM(`impressions`) AS `IMPRESSIONS`,
  SUM(`clicks`) AS `CLICKS`,
  SUM(`spend`) AS `COST`
FROM `facebook_ads_insights_monthly_insights`
GROUP BY
  1,
  2,
  3,
  4;