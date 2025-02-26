CREATE OR REPLACE TABLE "COMPARISON" AS
SELECT
		"source_medium",
    TO_DATE("date") AS "date",
    "medium",
    "source",
    "campaign",
    "ua_users"::VARCHAR as "ua_users",
    "ua_sessions"::VARCHAR as "ua_sessions",
    "ua_transactions"::VARCHAR as "ua_transactions",
    '' "ga4api_users",
    '' "ga4api_sessions",
    '' "ga4api_transactions",
    '' "ga4export_users",
    '' "ga4export_sessions",
    '' "ga4export_transactions",
    '' "ga4_ua_users",
    '' "ga4_ua_sessions",
    '' "ga4_ua_transactions"
FROM UA;