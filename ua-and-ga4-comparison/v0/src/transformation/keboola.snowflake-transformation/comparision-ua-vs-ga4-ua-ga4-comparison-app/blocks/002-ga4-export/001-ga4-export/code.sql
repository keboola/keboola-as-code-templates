CREATE OR REPLACE TABLE "GA4EXPORT" AS
WITH column_naming as ( --Column naming and various transformations and table joins
  SELECT
    "ROW" as ID,
    event."int_value" as session_id,
    properties_cid."string_value" as client_id,
    "user_pseudo_id" as user_pseudo_id,
    main."event_name" as event_name,
    properties_visitor."string_value" as visitor_id,
  	IFF(event_click."key" ='gclid','google',"trafficsource_source") as source,
    IFF(event_click."key" ='gclid','cpc',"trafficsource_name") as campaign,
    "trafficsource_medium" as medium,
    CASE WHEN main."event_name" = 'wizard_completed' THEN 1 ELSE 0 END as wizard_completed,
    TO_TIMESTAMP("event_timestamp") as event_timestamp,
    TO_DATE("event_date"::STRING,'YYYYMMDD') AS  date
  FROM "main_table" as main 
  LEFT JOIN (SELECT * FROM "user_properties" WHERE "key" = 'cid') as properties_cid USING ("ROW")
  LEFT JOIN (SELECT * FROM "user_properties" WHERE "key" = 'visitor_id') as properties_visitor USING ("ROW")
  LEFT JOIN (SELECT * FROM "event_params" WHERE "key" = 'ga_session_id') as event USING ("ROW")
  LEFT JOIN (SELECT * FROM "event_params" WHERE "key" = 'source') as event_source USING ("ROW")
  LEFT JOIN (SELECT * FROM "event_params" WHERE "key" = 'medium') as event_medium USING ("ROW")
  LEFT JOIN (SELECT * FROM "event_params" WHERE "key" = 'campaign') as event_campaign USING ("ROW")
  LEFT JOIN (SELECT * FROM "event_params" WHERE "key" = 'ignore_referrer') as event_ignore USING ("ROW")
  LEFT JOIN (SELECT * FROM "event_params" WHERE "key" = 'gclid') as event_click USING ("ROW")
)

SELECT
TO_DATE(date) as "date",
IFNULL(NULLIF(source,''), '(direct)') as "source",
IFNULL(NULLIF(medium,''), '(none)') as "medium",
IFNULL(NULLIF(campaign,''), 'uncategorized') as "campaign",
"source"||' / '||"medium" as "source_medium",
COUNT(DISTINCT USER_PSEUDO_ID) as "ga4export_users",
COUNT(DISTINCT SESSION_ID) as "ga4export_sessions",
SUM(WIZARD_COMPLETED) as "ga4export_transactions"
FROM column_naming
GROUP BY ALL
