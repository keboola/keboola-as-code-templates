/* GoogleAds campaigns source data */
CREATE TABLE `bdm_marketing_campaign_costs` (
  `MARKETING_CAMPAIGN_COSTS_ID` STRING NOT NULL,
  `SOURCE` STRING,
  `DATE` DATE,
  `CAMPAIGN` STRING,
  `IMPRESSIONS` INT64,
  `CLICKS` INT64,
  `COST` FLOAT64
)
INSERT INTO `bdm_marketing_campaign_costs`
SELECT
  `segmentsDate` || '-' || 'GoogleAds' || '-' || `campaignName` AS `MARKETING_CAMPAIGN_COSTS_ID`,
  'GoogleAds' AS `SOURCE`,
  CAST(`segmentsDate` AS DATE) AS `DATE`,
  `campaignName` AS `CAMPAIGN`,
  SUM(`metricsImpressions`) AS `IMPRESSIONS`,
  SUM(`metricsClicks`) AS `CLICKS`,
  SUM(`metricsCostMicros`) / 1000000 AS `COST`
FROM `report-campaign`
GROUP BY
  1,
  2,
  3,
  4
/* GoogleAds campaigns source data grouped by month */
CREATE TABLE `bdm_marketing_campaign_costs_monthly` (
  `MARKETING_CAMPAIGN_COSTS_ID` STRING NOT NULL,
  `SOURCE` STRING,
  `DATE` DATE,
  `CAMPAIGN` STRING,
  `IMPRESSIONS` INT64,
  `CLICKS` INT64,
  `COST` FLOAT64
)
INSERT INTO `bdm_marketing_campaign_costs_monthly`
SELECT
  LEFT(`segmentsDate`, 7) || '-01-' || 'GoogleAds' || '-' || `campaignName` AS `MARKETING_CAMPAIGN_COSTS_ID`,
  'GoogleAds' AS `SOURCE`,
  CAST(LEFT(`segmentsDate`, 7) AS DATE) || '-01' AS `DATE`,
  `campaignName` AS `CAMPAIGN`,
  SUM(`metricsImpressions`) AS `IMPRESSIONS`,
  SUM(`metricsClicks`) AS `CLICKS`,
  SUM(`metricsCostMicros`) / 1000000 AS `COST`
FROM `report-campaign`
GROUP BY
  1,
  2,
  3,
  4