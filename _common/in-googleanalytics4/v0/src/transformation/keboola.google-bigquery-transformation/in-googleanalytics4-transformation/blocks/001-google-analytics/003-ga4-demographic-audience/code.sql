CREATE TABLE `ga4_demographic_audience` (
  `id` STRING(2000) NOT NULL,
  `idProperty` STRING(255),
  `date` DATE,
  `userAgeBracket` STRING(255),
  `userGender` STRING(255),
  `language` STRING(255),
  `channelGrouping` STRING(255),
  `userType` STRING(255),
  `sessions` INT64,
  `engagedSessions` INT64,
  `bounces` INT64,
  `activeUsers` INT64,
  `newUsers` INT64,
  `totalUsers` INT64,
  `conversions` INT64,
  `userEngagementDuration` FLOAT64,
  `averageSessionDuration` FLOAT64,
  `screenPageViews` INT64,
  `eventCount` INT64
);

INSERT INTO `ga4_demographic_audience`
SELECT
  `id`, 
  /* dimensions */
  `idProperty`,
  CAST(`date` AS DATE) AS `date`,
  `userAgeBracket`,
  `userGender`,
  `language`,
  `sessionDefaultChannelGrouping` AS `channelGrouping`,
  `newVsReturning` AS `userType`, 
  /* metrics */
  CAST(`sessions` AS INT64) AS `sessions`,
  CAST(`engagedSessions` AS INT64) AS `engagedSessions`,
  CAST(`sessions` AS INT64) - CAST(`engagedSessions` AS INT64) AS `bounces`,
  CAST(`activeUsers` AS INT64) AS `activeUsers`,
  CAST(`newUsers` AS INT64) AS `newUsers`,
  CAST(`totalUsers` AS INT64) AS `totalUsers`,
  CAST(`conversions` AS INT64) AS `conversions`,
  CAST(`userEngagementDuration` AS FLOAT64) AS `userEngagementDuration`,
  CAST(`averageSessionDuration` AS FLOAT64) AS `averageSessionDuration`,
  CAST(`screenPageViews` AS INT64) AS `screenPageViews`,
  CAST(`eventCount` AS INT64) AS `eventCount`
FROM `raw_demographic`;