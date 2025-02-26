CREATE TABLE `ga_traffic_source` (
  `id_TBE` STRING(2000) NOT NULL,
  `ga_userType` STRING(255),
  `ga_date` DATE,
  `ga_campaign` STRING(255),
  `ga_source` STRING(255),
  `ga_medium` STRING(255),
  `ga_keyword` STRING(255),
  `ga_adContent` STRING(255),
  `ga_socialNetwork` STRING(255),
  `ga_channelGrouping` STRING(255),
  `ga_sessions` INT64,
  `ga_users` INT64,
  `ga_bounces` INT64,
  `ga_sessionDuration` FLOAT64,
  `ga_pageviews` INT64,
  `ga_organicSearches` INT64
);

INSERT INTO `ga_traffic_source`
SELECT
  `id` AS `id_TBE`, /* dimensions */
  CASE WHEN `userType` = 'Returning Visitor' THEN 0 ELSE 1 END AS `ga_userType`,
  `date` AS `ga_date`,
  `campaign` AS `ga_campaign`,
  `source` AS `ga_source`,
  `medium` AS `ga_medium`,
  `keyword` AS `ga_keyword`,
  `adContent` AS `ga_adContent`,
  `socialNetwork` AS `ga_socialNetwork`,
  `channelGrouping` AS `ga_channelGrouping`, /* metrics */
  `sessions` AS `ga_sessions`,
  `users` AS `ga_users`,
  `bounces` AS `ga_bounces`,
  `sessionDuration` AS `ga_sessionDuration`,
  `pageviews` AS `ga_pageviews`,
  `organicSearches` AS `ga_organicSearches`
FROM `raw_traffic_source`;