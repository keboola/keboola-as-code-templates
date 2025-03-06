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
);

INSERT INTO `ga4_ad_analytics`
SELECT
  `id`, /* dimensions */
  `idProperty`,
  CAST(`date` AS DATE) AS `date`,
  `sessionGoogleAdsAdGroupName` AS `adGroup`,
  `sessionGoogleAdsAdNetworkType` AS `adNetworkType`,
  `sessionGoogleAdsCampaignName` AS `campaign`, /* metrics */
  CAST(`advertiserAdImpressions` AS INT64) AS `adImpressions`,
  CAST(`advertiserAdClicks` AS INT64) AS `adClicks`,
  CAST(`advertiserAdCost` AS FLOAT64) AS `adCost`,
  CAST(`advertiserAdCostPerClick` AS FLOAT64) AS `adCPC`,
  CAST(`averagePurchaseRevenue` AS FLOAT64) AS `averagePurchaseRevenue`,
	CAST(`sessions` AS INT64) AS `sessions`,
  CAST(`engagedSessions` AS INT64) AS `engagedSessions`,
  CAST(`sessions` AS INT64) - CAST(`engagedSessions` AS INT64) AS `bounces`,
  CAST(`conversions` AS INT64) AS `conversions`,
  CAST(`activeUsers` AS INT64) AS `activeUsers`,
  CAST(`screenPageViews` AS INT64) AS `screenPageViews`
FROM `raw_ad_analytics`;