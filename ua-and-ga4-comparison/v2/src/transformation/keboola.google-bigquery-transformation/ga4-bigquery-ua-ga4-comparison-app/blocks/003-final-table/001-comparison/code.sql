UPDATE `COMPARISON` SET `ga4_ua_users` = GA4UA.`ga4_ua_users`, `ga4_ua_sessions` = GA4UA.`ga4_ua_sessions`, `ga4_ua_transactions` = GA4UA.`ga4_ua_transactions`
FROM GA4UA
WHERE
  `COMPARISON`.`date` = CAST(GA4UA.`date` AS DATE)
  AND `COMPARISON`.`source` = GA4UA.`source`
  AND `COMPARISON`.`medium` = GA4UA.`medium`
  AND `COMPARISON`.`campaign` = GA4UA.`campaign`
  AND `COMPARISON`.`source_medium` = GA4UA.`source_medium`
CREATE OR REPLACE TABLE `COMPARISON2` AS
SELECT
  `source_medium`,
  `date`,
  `medium`,
  `source`,
  `campaign`,
  `ua_users`,
  `ua_sessions`,
  `ua_transactions`,
  `ga4api_users`,
  `ga4api_sessions`,
  `ga4api_transactions`,
  `ga4export_users`,
  `ga4export_sessions`,
  `ga4export_transactions`,
  `ga4_ua_users`,
  `ga4_ua_sessions`,
  `ga4_ua_transactions`
FROM `COMPARISON`
UNION DISTINCT
SELECT
  `source_medium`,
  `date`,
  `medium`,
  `source`,
  `campaign`,
  '' AS `ua_users`,
  '' AS `ua_sessions`,
  '' AS `ua_transactions`,
  '' AS `ga4api_users`,
  '' AS `ga4api_sessions`,
  '' AS `ga4api_transactions`,
  '' AS `ga4export_users`,
  '' AS `ga4export_sessions`,
  '' AS `ga4export_transactions`,
  CAST(`ga4_ua_users` AS STRING) AS `ga4_ua_users`,
  CAST(`ga4_ua_sessions` AS STRING) AS `ga4_ua_sessions`,
  CAST(`ga4_ua_transactions` AS STRING) AS `ga4_ua_transactions`
FROM GA4UA
WHERE
  CONCAT_WS('_', `source_medium`, `date`, `medium`, `source`, `campaign`) <> ALL (
    SELECT
      CONCAT_WS('_', `source_medium`, `date`, `medium`, `source`, `campaign`)
    FROM `COMPARISON`
  )
UPDATE `COMPARISON2` SET `ga4export_users` = GA4EXPORT.`ga4export_users`, `ga4export_sessions` = GA4EXPORT.`ga4export_sessions`, `ga4export_transactions` = GA4EXPORT.`ga4export_transactions`
FROM GA4EXPORT
WHERE
  `COMPARISON2`.`date` = CAST(GA4EXPORT.`date` AS DATE)
  AND `COMPARISON2`.`source` = GA4EXPORT.`source`
  AND `COMPARISON2`.`medium` = GA4EXPORT.`medium`
  AND `COMPARISON2`.`campaign` = GA4EXPORT.`campaign`
  AND `COMPARISON2`.`source_medium` = GA4EXPORT.`source_medium`
CREATE OR REPLACE TABLE `COMPARISON3` AS
SELECT
  `source_medium`,
  `date`,
  `medium`,
  `source`,
  `campaign`,
  `ua_users`,
  `ua_sessions`,
  `ua_transactions`,
  `ga4api_users`,
  `ga4api_sessions`,
  `ga4api_transactions`,
  `ga4export_users`,
  `ga4export_sessions`,
  `ga4export_transactions`,
  `ga4_ua_users`,
  `ga4_ua_sessions`,
  `ga4_ua_transactions`
FROM `COMPARISON2`
UNION DISTINCT
SELECT
  `source_medium`,
  `date`,
  `medium`,
  `source`,
  `campaign`,
  '' AS `ua_users`,
  '' AS `ua_sessions`,
  '' AS `ua_transactions`,
  '' AS `ga4api_users`,
  '' AS `ga4api_sessions`,
  '' AS `ga4api_transactions`,
  CAST(`ga4export_users` AS STRING) AS `ga4export_users`,
  CAST(`ga4export_sessions` AS STRING) AS `ga4export_sessions`,
  CAST(`ga4export_transactions` AS STRING) AS `ga4export_transactions`,
  '' AS `ga4_ua_users`,
  '' AS `ga4_ua_sessions`,
  '' AS `ga4_ua_transactions`
FROM GA4EXPORT
WHERE
  CONCAT_WS('_', `source_medium`, `date`, `medium`, `source`, `campaign`) <> ALL (
    SELECT
      CONCAT_WS('_', `source_medium`, `date`, `medium`, `source`, `campaign`)
    FROM `COMPARISON2`
  )