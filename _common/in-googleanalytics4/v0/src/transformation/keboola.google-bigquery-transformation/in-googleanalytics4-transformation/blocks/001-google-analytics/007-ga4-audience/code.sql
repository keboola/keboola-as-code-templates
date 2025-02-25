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
)
INSERT INTO `ga4_audience`
SELECT
  `id`, /* dimensions */
  `idProperty`,
  `date`,
  `audienceId`,
  `audienceName`, /* metrics */
  `activeUsers`,
  `newUsers`,
  `totalUsers`,
  `sessions`,
  `engagedSessions`,
  `screenPageViews`,
  `averageSessionDuration`,
  `userEngagementDuration`
FROM `raw_audience`