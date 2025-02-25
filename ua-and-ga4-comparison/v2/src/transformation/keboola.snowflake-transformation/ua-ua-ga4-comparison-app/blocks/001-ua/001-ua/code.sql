CREATE OR REPLACE TABLE "UA" AS
SELECT
TO_DATE("date") as "date",
"source",
"medium",
"campaign" as "campaign",
"source"||' / '||"medium" as "source_medium",
SUM("transactions") as "ua_transactions",
SUM("sessions") as "ua_sessions",
SUM("users") as "ua_users"
FROM "Universal-Analytics"
GROUP BY ALL;
