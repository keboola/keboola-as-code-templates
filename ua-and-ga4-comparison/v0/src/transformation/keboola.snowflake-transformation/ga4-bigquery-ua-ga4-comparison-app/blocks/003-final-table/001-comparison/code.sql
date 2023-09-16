UPDATE "COMPARISON"
SET "ga4_ua_users" = GA4UA."ga4_ua_users", "ga4_ua_sessions" = GA4UA."ga4_ua_sessions", "ga4_ua_transactions" = GA4UA."ga4_ua_transactions"
FROM GA4UA
WHERE "COMPARISON"."date" = TO_DATE(GA4UA."date")
	AND "COMPARISON"."source" = GA4UA."source"
  AND "COMPARISON"."medium" = GA4UA."medium"
  AND "COMPARISON"."campaign" = GA4UA."campaign"
  AND "COMPARISON"."source_medium" = GA4UA."source_medium";

CREATE or replace TABLE "COMPARISON2" AS
SELECT
"source_medium",
     "date",
    "medium",
    "source",
    "campaign",
    "ua_users",
    "ua_sessions",
    "ua_transactions",
    "ga4api_users",
    "ga4api_sessions",
    "ga4api_transactions",
    "ga4export_users",
    "ga4export_sessions",
    "ga4export_transactions",
    "ga4_ua_users",
    "ga4_ua_sessions",
    "ga4_ua_transactions"
FROM "COMPARISON"
UNION
SELECT "source_medium",
     "date",
    "medium",
    "source",
    "campaign",
    '' "ua_users",
    '' "ua_sessions",
    '' "ua_transactions",
    '' "ga4api_users",
    '' "ga4api_sessions",
    '' "ga4api_transactions",
    '' "ga4export_users",
    '' "ga4export_sessions",
    '' "ga4export_transactions",
    "ga4_ua_users"::VARCHAR as "ga4_ua_users",
    "ga4_ua_sessions"::VARCHAR as "ga4_ua_sessions",
    "ga4_ua_transactions"::VARCHAR as "ga4_ua_transactions"
FROM GA4UA 
WHERE CONCAT_WS('_',"source_medium","date","medium","source","campaign") NOT IN (SELECT CONCAT_WS('_',"source_medium","date","medium","source","campaign") FROM "COMPARISON")
;

UPDATE "COMPARISON2"
SET "ga4export_users" = GA4EXPORT."ga4export_users", "ga4export_sessions" = GA4EXPORT."ga4export_sessions", "ga4export_transactions" = GA4EXPORT."ga4export_transactions"
FROM GA4EXPORT
WHERE "COMPARISON2"."date" = TO_DATE(GA4EXPORT."date")
	AND "COMPARISON2"."source" = GA4EXPORT."source"
  AND "COMPARISON2"."medium" = GA4EXPORT."medium"
  AND "COMPARISON2"."campaign" = GA4EXPORT."campaign"
  AND "COMPARISON2"."source_medium" = GA4EXPORT."source_medium";

CREATE or replace TABLE "COMPARISON3" AS
SELECT
"source_medium",
     "date",
    "medium",
    "source",
    "campaign",
    "ua_users",
    "ua_sessions",
    "ua_transactions",
    "ga4api_users",
    "ga4api_sessions",
    "ga4api_transactions",
    "ga4export_users",
    "ga4export_sessions",
    "ga4export_transactions",
    "ga4_ua_users",
    "ga4_ua_sessions",
    "ga4_ua_transactions"
FROM "COMPARISON2"
UNION
SELECT "source_medium",
     "date",
    "medium",
    "source",
    "campaign",
    '' "ua_users",
    '' "ua_sessions",
    '' "ua_transactions",
    '' "ga4api_users",
    '' "ga4api_sessions",
    '' "ga4api_transactions",
    "ga4export_users"::VARCHAR as "ga4export_users",
    "ga4export_sessions"::VARCHAR as "ga4export_sessions",
    "ga4export_transactions"::VARCHAR as "ga4export_transactions",
    '' "ga4_ua_users",
    '' "ga4_ua_sessions",
    '' "ga4_ua_transactions" 
FROM GA4EXPORT
WHERE CONCAT_WS('_',"source_medium","date","medium","source","campaign") NOT IN (SELECT CONCAT_WS('_',"source_medium","date","medium","source","campaign") FROM "COMPARISON2")
;