CREATE OR REPLACE TABLE `COMPARISON` AS
SELECT
  `source_medium`,
  CAST(`date` AS DATE) AS `date`,
  `medium`,
  `source`,
  `campaign`,
  CAST(`ua_users` AS STRING) AS `ua_users`,
  CAST(`ua_sessions` AS STRING) AS `ua_sessions`,
  CAST(`ua_transactions` AS STRING) AS `ua_transactions`,
  '' AS `ga4api_users`,
  '' AS `ga4api_sessions`,
  '' AS `ga4api_transactions`,
  '' AS `ga4export_users`,
  '' AS `ga4export_sessions`,
  '' AS `ga4export_transactions`,
  '' AS `ga4_ua_users`,
  '' AS `ga4_ua_sessions`,
  '' AS `ga4_ua_transactions`
FROM UA;