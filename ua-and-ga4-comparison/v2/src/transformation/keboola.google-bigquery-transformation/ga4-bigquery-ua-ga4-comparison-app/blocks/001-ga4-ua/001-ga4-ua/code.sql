CREATE OR REPLACE TABLE "GA4UA" AS
WITH column_naming as ( --Column naming and various transformations and table joins
  SELECT
    "ROW" as ID,
    event."int_value" as session_id,
    properties_cid."string_value" as client_id,
    "user_pseudo_id" as user_pseudo_id,
    main."event_name" as event_name,
    properties_visitor."string_value" as visitor_id,
    --REGEXP_REPLACE(properties_visitor.string_value, r'^{|}$', '') as visitor_id,
    NULLIF(CASE WHEN event_ignore."string_value" = 'true' THEN null ELSE IFF(event_click."key" ='gclid','google',event_source."string_value") END, '') as source,
    NULLIF(CASE WHEN event_ignore."string_value" = 'true' THEN null ELSE IFF(event_click."key" ='gclid','cpc', event_medium."string_value") END, '') as medium,
    IFNULL(event_click."string_value",event_click."double_value"::STRING) as gclid_id,
    NULLIF(IFF(event_ignore."string_value" = 'true',null,event_campaign."string_value"),'') as campaign,
    CASE WHEN main."event_name" = 'wizard_completed' THEN 1 ELSE 0 END as wizard_completed,
    TO_TIMESTAMP("event_timestamp") as event_timestamp,
    TO_DATE("event_date"::STRING,'YYYYMMDD') AS  date
  FROM "main_table" as main 
  LEFT JOIN (SELECT * FROM "user_properties" WHERE "key" = 'cid') as properties_cid USING ("ROW")
  LEFT JOIN (SELECT * FROM "user_properties" WHERE "key" = 'visitor_id') as properties_visitor USING ("ROW")
  LEFT JOIN (SELECT * FROM "event_params" WHERE "key" = 'ga_session_id') as event USING ("ROW")
  LEFT JOIN (SELECT * FROM "event_params" WHERE "key" = 'ignore_referrer') as event_ignore USING ("ROW")
  LEFT JOIN (SELECT * FROM "event_params" WHERE "key" = 'source') as event_source USING ("ROW")
  LEFT JOIN (SELECT * FROM "event_params" WHERE "key" = 'medium') as event_medium USING ("ROW")
  LEFT JOIN (SELECT * FROM "event_params" WHERE "key" = 'campaign') as event_campaign USING ("ROW")
  LEFT JOIN (SELECT * FROM "event_params" WHERE "key" = 'gclid') as event_click USING ("ROW")
),


calculating as (--Counting fields through session and users
  SELECT
    DISTINCT
    session_id,
    user_pseudo_id,
    MIN(event_timestamp) OVER (PARTITION BY session_id, user_pseudo_id) as session_start_date,
    COUNT(event_name) OVER (PARTITION BY session_id, user_pseudo_id) as events_per_session,
    FIRST_VALUE(source IGNORE NULLS) OVER (PARTITION BY session_id, user_pseudo_id ORDER BY event_timestamp rows between unbounded preceding and unbounded following) as session_source,
    FIRST_VALUE(campaign IGNORE NULLS) OVER (PARTITION BY session_id, user_pseudo_id ORDER BY event_timestamp rows between unbounded preceding and unbounded following) as session_campaign,
    FIRST_VALUE(medium IGNORE NULLS) OVER (PARTITION BY session_id, user_pseudo_id ORDER BY event_timestamp rows between unbounded preceding and unbounded following) as session_medium,
    FIRST_VALUE(gclid_id IGNORE NULLS) OVER (PARTITION BY session_id, user_pseudo_id ORDER BY event_timestamp rows between unbounded preceding and unbounded following) as gclid_id,
    FIRST_VALUE(visitor_id IGNORE NULLS) OVER (PARTITION BY session_id, user_pseudo_id ORDER BY event_timestamp rows between unbounded preceding and unbounded following) as visitor_id,
    sum(wizard_completed) OVER (PARTITION BY session_id, user_pseudo_id ) as wizard_completed
  FROM column_naming
),

final_distribution as (
SELECT
  session_id,
  user_pseudo_id,
  session_start_date,
  events_per_session,
  visitor_id,
  CASE WHEN session_source = 'google' and session_medium = 'cpc' THEN gclid_id ELSE null END as gclid,
  wizard_completed,
  IFNULL(session_source,LAST_VALUE(session_source IGNORE NULLS) OVER (PARTITION BY user_pseudo_id ORDER BY session_start_date asc ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)) as session_source,
  IFNULL(session_medium,LAST_VALUE(session_medium IGNORE NULLS) OVER (PARTITION BY user_pseudo_id ORDER BY session_start_date asc ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)) as session_medium,
  IFNULL(session_campaign,LAST_VALUE(session_campaign IGNORE NULLS) OVER (PARTITION BY user_pseudo_id ORDER BY session_start_date asc  ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)) as session_campaign
from calculating
)

SELECT
TO_DATE(SESSION_START_DATE) as "date",
IFNULL(session_source, '(direct)') as "source",
IFNULL(session_medium, '(none)') as "medium",
IFNULL(session_campaign, 'uncategorized') as "campaign",
"source"||' / '||"medium" as "source_medium",
COUNT(DISTINCT USER_PSEUDO_ID) as "ga4_ua_users",
COUNT(DISTINCT SESSION_ID) as "ga4_ua_sessions",
SUM(WIZARD_COMPLETED) as "ga4_ua_transactions"
FROM final_distribution
GROUP BY ALL;
