CREATE OR REPLACE TABLE `GA4UA` AS
WITH column_naming AS (
  SELECT
    `ROW` AS ID,
    event.`int_value` AS session_id,
    properties_cid.`string_value` AS client_id,
    `user_pseudo_id` AS user_pseudo_id,
    main.`event_name` AS event_name,
    properties_visitor.`string_value` AS visitor_id,
    NULLIF(
      CASE
        WHEN event_ignore.`string_value` = 'true'
        THEN NULL
        ELSE IF(event_click.`key` = 'gclid', 'google', event_source.`string_value`)
      END,
      ''
    ) AS source, /* REGEXP_REPLACE(properties_visitor.string_value, r'^{|}$', '') as visitor_id, */
    NULLIF(
      CASE
        WHEN event_ignore.`string_value` = 'true'
        THEN NULL
        ELSE IF(event_click.`key` = 'gclid', 'cpc', event_medium.`string_value`)
      END,
      ''
    ) AS medium,
    COALESCE(event_click.`string_value`, CAST(event_click.`double_value` AS STRING)) AS gclid_id,
    NULLIF(IF(event_ignore.`string_value` = 'true', NULL, event_campaign.`string_value`), '') AS campaign,
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
      `key` = 'ignore_referrer'
  ) AS event_ignore
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
      `key` = 'gclid'
  ) AS event_click
    USING (`ROW`)
), calculating AS (
  SELECT DISTINCT
    session_id,
    user_pseudo_id,
    MIN(event_timestamp) OVER (PARTITION BY session_id, user_pseudo_id) AS session_start_date,
    COUNT(event_name) OVER (PARTITION BY session_id, user_pseudo_id) AS events_per_session,
    FIRST_VALUE(source IGNORE NULLS) OVER (PARTITION BY session_id, user_pseudo_id ORDER BY event_timestamp rows BETWEEN UNBOUNDED preceding AND UNBOUNDED following) AS session_source,
    FIRST_VALUE(campaign IGNORE NULLS) OVER (PARTITION BY session_id, user_pseudo_id ORDER BY event_timestamp rows BETWEEN UNBOUNDED preceding AND UNBOUNDED following) AS session_campaign,
    FIRST_VALUE(medium IGNORE NULLS) OVER (PARTITION BY session_id, user_pseudo_id ORDER BY event_timestamp rows BETWEEN UNBOUNDED preceding AND UNBOUNDED following) AS session_medium,
    FIRST_VALUE(gclid_id IGNORE NULLS) OVER (PARTITION BY session_id, user_pseudo_id ORDER BY event_timestamp rows BETWEEN UNBOUNDED preceding AND UNBOUNDED following) AS gclid_id,
    FIRST_VALUE(visitor_id IGNORE NULLS) OVER (PARTITION BY session_id, user_pseudo_id ORDER BY event_timestamp rows BETWEEN UNBOUNDED preceding AND UNBOUNDED following) AS visitor_id,
    SUM(wizard_completed) OVER (PARTITION BY session_id, user_pseudo_id) AS wizard_completed
  FROM column_naming
), final_distribution AS (
  SELECT
    session_id,
    user_pseudo_id,
    session_start_date,
    events_per_session,
    visitor_id,
    CASE
      WHEN session_source = 'google' AND session_medium = 'cpc'
      THEN gclid_id
      ELSE NULL
    END AS gclid,
    wizard_completed,
    COALESCE(
      session_source,
      LAST_VALUE(session_source IGNORE NULLS) OVER (PARTITION BY user_pseudo_id ORDER BY session_start_date ASC ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
    ) AS session_source,
    COALESCE(
      session_medium,
      LAST_VALUE(session_medium IGNORE NULLS) OVER (PARTITION BY user_pseudo_id ORDER BY session_start_date ASC ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
    ) AS session_medium,
    COALESCE(
      session_campaign,
      LAST_VALUE(session_campaign IGNORE NULLS) OVER (PARTITION BY user_pseudo_id ORDER BY session_start_date ASC ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
    ) AS session_campaign
  FROM calculating
)
SELECT
  CAST(SESSION_START_DATE AS DATE) AS `date`,
  COALESCE(session_source, '(direct)') AS `source`,
  COALESCE(session_medium, '(none)') AS `medium`,
  COALESCE(session_campaign, 'uncategorized') AS `campaign`,
  `source` || ' / ' || `medium` AS `source_medium`,
  COUNT(DISTINCT USER_PSEUDO_ID) AS `ga4_ua_users`,
  COUNT(DISTINCT SESSION_ID) AS `ga4_ua_sessions`,
  SUM(WIZARD_COMPLETED) AS `ga4_ua_transactions`
FROM final_distribution
GROUP BY ALL;