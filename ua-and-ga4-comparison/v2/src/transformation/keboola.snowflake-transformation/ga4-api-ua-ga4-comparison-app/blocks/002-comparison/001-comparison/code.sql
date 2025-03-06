UPDATE "COMPARISON"
SET "ga4api_users" = GA4API."ga4api_users", "ga4api_sessions" = GA4API."ga4api_sessions", "ga4api_transactions" = GA4API."ga4api_transactions"
FROM GA4API
WHERE "COMPARISON"."date" = TO_DATE(GA4API."date")
	AND "COMPARISON"."source" = GA4API."source"
  AND "COMPARISON"."medium" = GA4API."medium"
  AND "COMPARISON"."campaign" = GA4API."campaign"
  AND "COMPARISON"."source_medium" = GA4API."source_medium";

CREATE TABLE "COMPARISON2" AS
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
    "ga4api_users"::VARCHAR as "ga4api_users",
    "ga4api_sessions"::VARCHAR as "ga4api_sessions",
    "ga4api_transactions"::VARCHAR as "ga4api_transactions",
    '' "ga4export_users",
    '' "ga4export_sessions",
    '' "ga4export_transactions",
    '' "ga4_ua_users",
    '' "ga4_ua_sessions",
    '' "ga4_ua_transactions" 
FROM GA4API g
WHERE CONCAT_WS('_',"source_medium","date","medium","source","campaign") NOT IN (SELECT CONCAT_WS('_',"source_medium","date","medium","source","campaign") FROM "COMPARISON")
;