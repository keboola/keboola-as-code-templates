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
  `id`, /* dimensions */
  `idProperty`,
  `date`,
  `userAgeBracket`,
  `userGender`,
  `language`,
  `sessionDefaultChannelGrouping` AS `channelGrouping`,
  `newVsReturning` AS `userType`, /* metrics */
  `sessions`,
  `engagedSessions`,
  CAST(`sessions` AS INT64) - CAST(`engagedSessions` AS INT64) AS `bounces`,
  `activeUsers`,
  `newUsers`,
  `totalUsers`,
  `conversions`,
  `userEngagementDuration`,
  `averageSessionDuration`,
  `screenPageViews`,
  `eventCount`
FROM `raw_demographic`;