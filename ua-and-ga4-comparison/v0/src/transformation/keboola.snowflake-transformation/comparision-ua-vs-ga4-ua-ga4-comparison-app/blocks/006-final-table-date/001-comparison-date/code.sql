CREATE OR REPLACE TABLE "COMPARISON_DATE" AS
SELECT
    TO_DATE("date") AS "date",
    SUM(IFNULL("ua_users",0)) AS "ua_users",
    SUM(IFNULL("ua_sessions",0)) AS "ua_sessions",
    SUM(IFNULL("ua_transactions",0)) AS "ua_transactions",
    SUM(IFNULL("ga4api_users",0)) AS "ga4api_users",
    SUM(IFNULL("ga4api_sessions",0)) AS "ga4api_sessions",
    SUM(IFNULL("ga4api_transactions",0)) AS "ga4api_transactions",
    SUM(IFNULL("ga4export_users",0)) AS "ga4export_users",
    SUM(IFNULL("ga4export_sessions",0)) AS "ga4export_sessions",
    SUM(IFNULL("ga4export_transactions",0)) AS "ga4export_transactions",
    SUM(IFNULL("ga4_ua_users",0)) AS "ga4_ua_users",
    SUM(IFNULL("ga4_ua_sessions",0)) AS "ga4_ua_sessions",
    SUM(IFNULL("ga4_ua_transactions",0)) AS "ga4_ua_transactions"
    
FROM GA4API
FULL OUTER JOIN GA4EXPORT USING ("date","source","medium","campaign","source_medium")
FULL OUTER JOIN GA4UA USING ("date","source","medium","campaign","source_medium")
FULL OUTER JOIN UA USING ("date","source","medium","campaign","source_medium")
WHERE TO_DATE("date") BETWEEN '2023-01-01' and '2023-06-01'
GROUP BY ALL
