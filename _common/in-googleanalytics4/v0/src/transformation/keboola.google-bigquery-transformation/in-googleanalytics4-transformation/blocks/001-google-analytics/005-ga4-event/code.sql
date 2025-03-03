CREATE TABLE `ga4_event` (
  `id` STRING(2000) NOT NULL,
  `idProperty` STRING(255),
  `date` DATE,
  `eventName` STRING(255),
  `isConversionEvent` BOOL, /* metrics */
  `eventCount` INT64,
  `eventValue` INT64,
  `totalUsers` INT64,
  `activeUsers` INT64,
  `newUsers` INT64
);

INSERT INTO `ga4_event`
SELECT
  `id`, 
  /* dimensions */
  `idProperty`,
  CAST(`date` AS DATE) AS `date`,
  `eventName`,
  CAST(IF(`isConversionEvent` = 'true', TRUE, FALSE) AS BOOL) AS `isConversionEvent`, 
  /* metrics */
  CAST(`eventCount` AS INT64) AS `eventCount`,
	CAST(ROUND(CAST(`eventValue` AS FLOAT64), 0) AS INT64) AS `eventValue`,
  CAST(`totalUsers` AS INT64) AS `totalUsers`,
  CAST(`activeUsers` AS INT64) AS `activeUsers`,
  CAST(`newUsers` AS INT64) AS `newUsers`
FROM `raw_event`;
