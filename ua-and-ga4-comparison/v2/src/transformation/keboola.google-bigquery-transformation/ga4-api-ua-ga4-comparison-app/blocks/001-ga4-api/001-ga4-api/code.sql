CREATE OR REPLACE TABLE `GA4API` AS
WITH `users` AS (
  SELECT
    CAST(`date` AS DATE) AS `date`,
    COALESCE(NULLIF(`source`, ''), '(direct)') AS `source`,
    COALESCE(NULLIF(`medium`, ''), '(none)') AS `medium`,
    COALESCE(NULLIF(`campaignName`, ''), 'uncategorized') AS `campaign`,
    COALESCE(NULLIF(`source`, ''), '(direct)') || ' / ' || COALESCE(NULLIF(`medium`, ''), '(none)') AS `source_medium`,
    SUM(`sessions`) AS `ga4api_sessions`,
    SUM(`totalUsers`) AS `ga4api_users`
  FROM `ga4api_without_transactions`
  GROUP BY ALL
), `transactions` AS (
  SELECT
    CAST(`date` AS DATE) AS `date`,
    COALESCE(NULLIF(`source`, ''), '(direct)') AS `source`,
    COALESCE(NULLIF(`medium`, ''), '(none)') AS `medium`,
    COALESCE(NULLIF(`campaignName`, ''), 'uncategorized') AS `campaign`,
    COALESCE(NULLIF(`source`, ''), '(direct)') || ' / ' || COALESCE(NULLIF(`medium`, ''), '(none)') AS `source_medium`,
    COUNT(NULLIF(NULLIF(`transactionId`, '(not set)'), '')) AS `ga4api_transactions`
  FROM `ga4api_t`
  GROUP BY ALL
)
SELECT
  *
FROM `users`
FULL OUTER JOIN `transactions`
  USING (`date`, `source`, `medium`, `campaign`, `source_medium`)