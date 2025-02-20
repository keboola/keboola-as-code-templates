CREATE TABLE `ga4_ad_analytics` (
  `id` STRING(2000) NOT NULL,
  `idProperty` STRING(255),
  `date` DATE,
  `adGroup` STRING(255),
  `adNetworkType` STRING(255),
  `campaign` STRING(255),
  `adImpressions` INT64,
  `adClicks` INT64,
  `adCost` FLOAT64,
  `adCPC` FLOAT64,
  `averagePurchaseRevenue` FLOAT64,
  `sessions` INT64,
  `engagedSessions` INT64,
  `bounces` INT64,
  `conversions` INT64,
  `activeUsers` INT64,
  `screenPageViews` INT64
)
INSERT INTO `ga4_ad_analytics`
SELECT
  `id`, /* dimensions */
  `idProperty`,
  `date`,
  `sessionGoogleAdsAdGroupName` AS `adGroup`,
  `sessionGoogleAdsAdNetworkType` AS `adNetworkType`,
  `sessionGoogleAdsCampaignName` AS `campaign`, /* metrics */
  `advertiserAdImpressions` AS `adImpressions`,
  `advertiserAdClicks` AS `adClicks`,
  `advertiserAdCost` AS `adCost`,
  `advertiserAdCostPerClick` AS `adCPC`,
  `averagePurchaseRevenue`,
  `sessions`,
  `engagedSessions`,
  CAST(`sessions` AS INT64) - CAST(`engagedSessions` AS INT64) AS `bounces`,
  `conversions`,
  `activeUsers`,
  `screenPageViews`
FROM `raw_ad_analytics`