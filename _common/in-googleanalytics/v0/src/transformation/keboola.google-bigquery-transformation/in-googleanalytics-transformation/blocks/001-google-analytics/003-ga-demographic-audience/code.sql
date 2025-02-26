CREATE TABLE `ga_demographic_audience` (
  `id_TBE` STRING(2000) NOT NULL,
  `ga_date` DATE,
  `ga_userAgeBracket` STRING(255),
  `ga_userGender` STRING(255),
  `ga_interestAffinityCategory` STRING(255),
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

INSERT INTO `ga_demographic_audience`
SELECT
  `id` AS `id_TBE`, /* dimensions */
  `date` AS `ga_date`,
  `userAgeBracket` AS `ga_userAgeBracket`,
  `userGender` AS `ga_userGender`,
  `interestAffinityCategory` AS `ga_interestAffinityCategory`,
  `channelGrouping` AS `ga_channelGrouping`,
  `userType` AS `ga_userType`,
  '' AS `ga_source`,
  '' AS `ga_medium`, /* metrics */
  `sessions` AS `ga_sessions`,
  `users` AS `ga_users`,
  `bounces` AS `ga_bounces`,
  `sessionDuration` AS `ga_sessionDuration`,
  `pageviews` AS `ga_pageviews`
FROM `raw_demographic_audience`;