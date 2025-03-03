CREATE TABLE `ga4_traffic_source` (
  `id` STRING(2000) NOT NULL,
  `idProperty` STRING(255),
  `date` DATE,
  `campaign` STRING(2000),
  `medium` STRING(255),
  `source` STRING(255),
  `userType` STRING(255),
  `channelGrouping` STRING(255),
  `sessions` INT64,
  `engagedSessions` INT64,
  `bounces` INT64,
  `activeUsers` INT64,
  `newUsers` INT64,
  `totalUsers` INT64,
  `userEngagementDuration` FLOAT64,
  `averageSessionDuration` FLOAT64,
  `screenPageViews` INT64,
  `conversions` INT64,
  `eventCount` INT64
);

INSERT INTO `ga4_traffic_source`
SELECT
  `id`, /* dimensions */
  `idProperty`,
  CAST(`date` AS DATE) AS `date`,
  `sessionCampaignName` AS `campaign`,
  `sessionMedium` AS `medium`,
  `sessionSource` AS `source`,
  `newVsReturning` AS `userType`,
  `sessionDefaultChannelGrouping` AS `channelGrouping`, /* metrics */
  CAST(`sessions` AS INT64) `sessions`,
  CAST(`engagedSessions` AS INT64) AS `engagedSessions`,
  CAST(`sessions` AS INT64) - CAST(`engagedSessions` AS INT64) AS `bounces`,
  CAST(`activeUsers` AS INT64) AS `activeUsers`,
  CAST(`newUsers` AS INT64) AS `newUsers`,
  CAST(`totalUsers` AS INT64) AS `totalUsers`,
  CAST(`userEngagementDuration` AS FLOAT64) AS `userEngagementDuration`,
  CAST(`averageSessionDuration` AS FLOAT64) AS `averageSessionDuration`,
  CAST(`screenPageViews` AS INT64) AS `screenPageViews`,
  CAST(`conversions` AS INT64) AS `conversions`,
  CAST(`eventCount` AS INT64) AS `eventCount`
FROM `raw_traffic_acquisition`;