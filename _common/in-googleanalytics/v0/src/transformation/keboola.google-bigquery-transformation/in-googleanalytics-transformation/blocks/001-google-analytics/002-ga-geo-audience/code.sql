CREATE TABLE `ga_geo_audience` (
  `id_TBE` STRING(2000) NOT NULL,
  `ga_date` DATE,
  `ga_country` STRING(255),
  `ga_region` STRING(255),
  `ga_latitude` FLOAT64,
  `ga_longitude` FLOAT64,
  `ga_channelGrouping` STRING(255),
  `ga_userType` STRING(255),
  `ga_source` STRING(255),
  `ga_medium` STRING(255),
  `ga_sessions` INT64,
  `ga_users` INT64,
  `ga_bounces` INT64,
  `ga_sessionDuration` FLOAT64,
  `ga_pageviews` INT64
);

INSERT INTO `ga_geo_audience`
SELECT
  `id` AS `id_TBE`, /* dimensions */
  `date` AS `ga_date`,
  `country` AS `ga_country`,
  `region` AS `ga_region`,
  `latitude` AS `ga_latitude`,
  `longitude` AS `ga_longitude`,
  `channelGrouping` AS `ga_channelGrouping`,
  CASE WHEN `userType` = 'Returning Visitor' THEN 0 ELSE 1 END AS `ga_userType`,
  `source` AS `ga_source`,
  `medium` AS `ga_medium`, /* metrics */
  `sessions` AS `ga_sessions`,
  `users` AS `ga_users`,
  `bounces` AS `ga_bounces`,
  `sessionDuration` AS `ga_sessionDuration`,
  `pageviews` AS `ga_pageviews`
FROM `raw_geo_audience`;