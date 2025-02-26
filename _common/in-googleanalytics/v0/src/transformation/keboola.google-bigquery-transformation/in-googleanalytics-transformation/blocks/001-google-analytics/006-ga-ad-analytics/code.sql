CREATE TABLE `ga_ad_analytics` (
  `id_TBE` STRING(2000) NOT NULL,
  `ga_date` DATE,
  `ga_adGroup` STRING(255),
  `ga_adContent` STRING(255),
  `ga_adDistributionNetwork` STRING(255),
  `ga_campaign` STRING(255),
  `ga_adSlot` STRING(255),
  `ga_impressions` INT64,
  `ga_adClicks` INT64,
  `ga_adCost` FLOAT64,
  `ga_CPM` FLOAT64,
  `ga_CPC` FLOAT64,
  `ga_transactionRevenue` FLOAT64,
  `ga_sessions` INT64,
  `ga_bounces` INT64,
  `ga_users` INT64,
  `ga_pageviews` INT64
);

INSERT INTO `ga_ad_analytics`
SELECT
  `id` AS `id_TBE`, /* dimensions */
  `date` AS `ga_date`,
  `adGroup` AS `ga_adGroup`,
  `adContent` AS `ga_adContent`,
  `adDistributionNetwork` AS `ga_adDistributionNetwork`,
  `campaign` AS `ga_campaign`,
  `adSlot` AS `ga_adSlot`, /* metrics */
  `impressions` AS `ga_impressions`,
  `adClicks` AS `ga_adClicks`,
  `adCost` AS `ga_adCost`,
  `CPM` AS `ga_CPM`,
  `CPC` AS `ga_CPC`,
  `transactionRevenue` AS `ga_transactionRevenue`,
  `sessions` AS `ga_sessions`,
  `bounces` AS `ga_bounces`,
  `users` AS `ga_users`,
  `pageviews` AS `ga_pageviews`
FROM `raw_ad_analytics`;