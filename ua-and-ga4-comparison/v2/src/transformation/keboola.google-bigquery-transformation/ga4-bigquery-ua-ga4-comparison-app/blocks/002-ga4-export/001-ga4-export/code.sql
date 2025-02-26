CREATE OR REPLACE TABLE `GA4EXPORT` AS
WITH column_naming AS (
  SELECT
    `ROW` AS ID,
    event.`int_value` AS session_id,
    properties_cid.`string_value` AS client_id,
    `user_pseudo_id` AS user_pseudo_id,
    main.`event_name` AS event_name,
    properties_visitor.`string_value` AS visitor_id,
    IF(event_click.`key` = 'gclid', 'google', `trafficsource_source`) AS source,
    IF(event_click.`key` = 'gclid', 'cpc', `trafficsource_name`) AS campaign,
    `trafficsource_medium` AS medium,
    CASE WHEN main.`event_name` = 'wizard_completed' THEN 1 ELSE 0 END AS wizard_completed,
    TO_TIMESTAMP(`event_timestamp`) AS event_timestamp,
    CAST(PARSE_TIMESTAMP('%Y%m%d', CAST(`event_date` AS STRING)) AS DATE) AS date
  FROM `main_table` AS main
  LEFT JOIN (
    SELECT
      *
    FROM `user_properties`
    WHERE
      `key` = 'cid'
  ) AS properties_cid
    USING (`ROW`)
  LEFT JOIN (
    SELECT
      *
    FROM `user_properties`
    WHERE
      `key` = 'visitor_id'
  ) AS properties_visitor
    USING (`ROW`)
  LEFT JOIN (
    SELECT
      *
    FROM `event_params`
    WHERE
      `key` = 'ga_session_id'
  ) AS event
    USING (`ROW`)
  LEFT JOIN (
    SELECT
      *
    FROM `event_params`
    WHERE
      `key` = 'source'
  ) AS event_source
    USING (`ROW`)
  LEFT JOIN (
    SELECT
      *
    FROM `event_params`
    WHERE
      `key` = 'medium'
  ) AS event_medium
    USING (`ROW`)
  LEFT JOIN (
    SELECT
      *
    FROM `event_params`
    WHERE
      `key` = 'campaign'
  ) AS event_campaign
    USING (`ROW`)
  LEFT JOIN (
    SELECT
      *
    FROM `event_params`
    WHERE
      `key` = 'ignore_referrer'
  ) AS event_ignore
    USING (`ROW`)
  LEFT JOIN (
    SELECT
      *
    FROM `event_params`
    WHERE
      `key` = 'gclid'
  ) AS event_click
    USING (`ROW`)
)
SELECT
  CAST(date AS DATE) AS `date`,
  COALESCE(NULLIF(source, ''), '(direct)') AS `source`,
  COALESCE(NULLIF(medium, ''), '(none)') AS `medium`,
  COALESCE(NULLIF(campaign, ''), 'uncategorized') AS `campaign`,
  `source` || ' / ' || `medium` AS `source_medium`,
  COUNT(DISTINCT USER_PSEUDO_ID) AS `ga4export_users`,
  COUNT(DISTINCT SESSION_ID) AS `ga4export_sessions`,
  SUM(WIZARD_COMPLETED) AS `ga4export_transactions`
FROM column_naming
GROUP BY ALL;