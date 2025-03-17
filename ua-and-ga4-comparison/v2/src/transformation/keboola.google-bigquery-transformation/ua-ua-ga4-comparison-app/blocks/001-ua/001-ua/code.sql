CREATE OR REPLACE TABLE `UA` AS
SELECT
  CAST(`date` AS DATE) AS `date`,
  `source`,
  `medium`,
  `campaign` AS `campaign`,
  `source` || ' / ' || `medium` AS `source_medium`,
  SUM(`transactions`) AS `ua_transactions`,
  SUM(`sessions`) AS `ua_sessions`,
  SUM(`users`) AS `ua_users`
FROM `Universal-Analytics`
GROUP BY ALL;