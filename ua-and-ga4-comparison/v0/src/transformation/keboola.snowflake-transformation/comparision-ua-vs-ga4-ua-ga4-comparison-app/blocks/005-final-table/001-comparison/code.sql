CREATE OR REPLACE TABLE "COMPARISON" AS
SELECT
		"source_medium",
    TO_DATE("date") AS "date",
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
    
FROM GA4API
FULL OUTER JOIN GA4EXPORT USING ("date","source","medium","campaign","source_medium")
FULL OUTER JOIN GA4UA USING ("date","source","medium","campaign","source_medium")
FULL OUTER JOIN UA USING ("date","source","medium","campaign","source_medium")
WHERE TO_DATE("date") BETWEEN '2023-01-01' and '2023-06-01'
