CREATE TABLE `ga4_page_behaviour` (
  `id` STRING(2000) NOT NULL,
  `idProperty` STRING(255),
  `date` DATE,
  `hostName` STRING(255),
  `pagePath` STRING(2000),
  `landingPage` STRING(2000),
  `landingpagePlusQueryString` STRING(2000),
  `pageTitle` STRING(500),
  `country` STRING(255),
  `deviceCategory` STRING(255),
  `language` STRING(255),
  `sessions` INT64,
  `engagedSessions` INT64,
  `bounces` INT64,
  `activeUsers` INT64,
  `newUsers` INT64,
  `totalUsers` INT64,
  `screenPageViews` INT64,
  `conversions` INT64,
  `userEngagementDuration` FLOAT64,
  `averageSessionDuration` FLOAT64,
  `eventCount` INT64
);

INSERT INTO `ga4_page_behaviour`
SELECT
  `id`, 
  /* dimensions */
  `idProperty`,
  CAST(`date` AS DATE) AS `date`,
  `hostName`,
  `pagePath`,
  `landingPage`,
  `landingpagePlusQueryString`,
  `pageTitle`,
  `country`,
  `deviceCategory`,
  `language`, 
  /* metrics */
  CAST(`sessions` AS INT64) AS `sessions`,
  CAST(`engagedSessions` AS INT64) `engagedSessions`,
  CAST(`sessions` AS INT64) - CAST(`engagedSessions` AS INT64) AS `bounces`,
  CAST(`activeUsers` AS INT64) AS `activeUsers`,
  CAST(`newUsers` AS INT64) AS `newUsers`,
  CAST(`totalUsers` AS INT64) AS `totalUsers`,
  CAST(`screenPageViews` AS INT64) AS `screenPageViews`,
  CAST(`conversions` AS INT64) AS `conversions`,
  CAST(`userEngagementDuration` AS FLOAT64) AS `userEngagementDuration`,
  CAST(`averageSessionDuration` AS FLOAT64) AS `averageSessionDuration`,
  CAST(`eventCount` AS INT64) AS `eventCount`
FROM `raw_landing_page_statistics`;