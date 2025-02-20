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
)
INSERT INTO `ga4_event`
SELECT
  `id`, /* dimensions */
  `idProperty`,
  `date`,
  `eventName`,
  IF(`isConversionEvent` = TRUE, TRUE, FALSE) AS `isConversionEvent`, /* metrics */
  `eventCount`,
  `eventValue`,
  `totalUsers`,
  `activeUsers`,
  `newUsers`
FROM `raw_event`