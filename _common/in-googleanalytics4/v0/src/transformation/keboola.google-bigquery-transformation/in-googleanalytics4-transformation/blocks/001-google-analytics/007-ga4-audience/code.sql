CREATE TABLE `ga4_audience` (
  `id` STRING(2000) NOT NULL,
  `idProperty` STRING(255),
  `date` DATE,
  `audienceId` STRING(255),
  `audienceName` STRING(255),
  `activeUsers` INT64,
  `newUsers` INT64,
  `totalUsers` INT64,
  `sessions` INT64,
  `engagedSessions` INT64,
  `screenPageViews` INT64,
  `averageSessionDuration` FLOAT64,
  `userEngagementDuration` FLOAT64
);

INSERT INTO `ga4_audience`
SELECT
  `id`, 
  /* dimensions */
  `idProperty`,
  CAST(`date` AS DATE) AS `date`,
  `audienceId`,
  `audienceName`, 
  /* metrics */
  CAST(`activeUsers` AS INT64) AS `activeUsers`,
  CAST(`newUsers` AS INT64) AS `newUsers`,
  CAST(`totalUsers` AS INT64) AS `totalUsers`,
	CAST(`sessions` AS INT64) AS `sessions`,
  CAST(`engagedSessions` AS INT64) `engagedSessions`,
  CAST(`screenPageViews` AS INT64) AS `screenPageViews`,
  CAST(`averageSessionDuration` AS FLOAT64) AS `averageSessionDuration`,  
  CAST(`userEngagementDuration` AS FLOAT64) AS `userEngagementDuration`
FROM `raw_audience`;