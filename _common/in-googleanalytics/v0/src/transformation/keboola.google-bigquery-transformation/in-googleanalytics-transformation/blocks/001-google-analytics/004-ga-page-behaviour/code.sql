CREATE TABLE `ga_page_behaviour` (
  `id_TBE` STRING(2000) NOT NULL,
  `ga_date` DATE,
  `ga_hostname` STRING(255),
  `ga_pagePath` STRING(2000),
  `ga_landingPagePath` STRING(2000),
  `ga_secondPagePath` STRING(2000),
  `ga_exitPagePath` STRING(2000),
  `ga_pageTitle` STRING(2000),
  `ga_source` STRING(2000),
  `ga_country` STRING(255),
  `ga_sessions` INT64,
  `ga_entrances` INT64,
  `ga_pageviews` INT64,
  `ga_timeOnPage` FLOAT64,
  `ga_exits` INT64,
  `ga_pageValue` FLOAT64
);

INSERT INTO `ga_page_behaviour`
SELECT
  `id` AS `id_TBE`, /* dimensions */
  `date` AS `ga_date`,
  `hostname` AS `ga_hostname`,
  `pagePath` AS `ga_pagePath`,
  `landingPagePath` AS `ga_landingPagePath`,
  `secondPagePath` AS `ga_secondPagePath`,
  `exitPagePath` AS `ga_exitPagePath`,
  `pageTitle` AS `ga_pageTitle`,
  `source` AS `ga_source`,
  `country` AS `ga_country`, /* metric */
  NULLIF(`sessions`, '') AS `ga_sessions`,
  NULLIF(`entrances`, '') AS `ga_entrances`,
  NULLIF(`pageviews`, '') AS `ga_pageviews`,
  NULLIF(`timeOnPage`, '') AS `ga_timeOnPage`,
  NULLIF(`exits`, '') AS `ga_exits`,
  NULLIF(`pageValue`, '') AS `ga_pageValue`
FROM `raw_page_behaviour`;