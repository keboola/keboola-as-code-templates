CREATE TABLE `ga_site_statistics` (
  `id_TBE` STRING(2000) NOT NULL,
  `ga_date` DATE,
  `ga_time` STRING(255),
  `ga_hostname` STRING(255),
  `ga_pagePath` STRING(1024),
  `ga_country` STRING(255),
  `ga_browser` STRING(255),
  `ga_operatingSystemVersion` STRING(255),
  `ga_deviceCategory` STRING(255),
  `ga_operatingSystem` STRING(255),
  `ga_language` STRING(255),
  `ga_sessions` INT64,
  `ga_pageviews` INT64,
  `ga_avgPageLoadTime` FLOAT64,
  `ga_avgPageDownloadTime` FLOAT64,
  `ga_avgRedirectionTime` FLOAT64,
  `ga_avgServerConnectionTime` FLOAT64,
  `ga_serverResponseTime` INT64
);

INSERT INTO `ga_site_statistics`
SELECT
  `id` AS `id_TBE`, /* dimensions */
  CAST(PARSE_TIMESTAMP('%Y%m%d', CAST(LEFT(`dateHourMinute`, 8) AS STRING)) AS DATE) AS `ga_date`,
  TIME(CAST(RIGHT(CAST(`dateHourMinute` AS STRING), 4) AS STRING), '%H%M') AS `ga_time`,
  `hostname` AS `ga_hostname`,
  `pagePath` AS `ga_pagePath`,
  `country` AS `ga_country`,
  `browser` AS `ga_browser`,
  `operatingSystemVersion` AS `ga_operatingSystemVersion`,
  `deviceCategory` AS `ga_deviceCategory`,
  `operatingSystem` AS `ga_operatingSystem`,
  `language` AS `ga_language`, /* metrics */
  `sessions` AS `ga_sessions`,
  `pageviews` AS `ga_pageviews`,
  `avgPageLoadTime` AS `ga_avgPageLoadTime`,
  `avgPageDownloadTime` AS `ga_avgPageDownloadTime`,
  `avgRedirectionTime` AS `ga_avgRedirectionTime`,
  `avgServerConnectionTime` AS `ga_avgServerConnectionTime`,
  `serverResponseTime` AS `ga_serverResponseTime`
FROM `raw_site_statistics`;