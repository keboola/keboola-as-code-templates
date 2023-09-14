CREATE OR REPLACE TABLE "GA4API" AS
  WITH "users" as (
  SELECT
    TO_DATE("date") as "date",
    IFNULL(NULLIF("source",''), '(direct)') as "source",
    IFNULL(NULLIF("medium",''), '(none)') as "medium",
    IFNULL(NULLIF("campaignName",''), 'uncategorized') as "campaign",
    IFNULL(NULLIF("source",''), '(direct)')||' / '||IFNULL(NULLIF("medium",''), '(none)') as "source_medium",
    sum("sessions") as "ga4api_sessions",
    sum("totalUsers") as "ga4api_users"
  FROM "ga4api_without_transactions"
  GROUP BY ALL
  ),


  "transactions" as (
  SELECT
    TO_DATE("date") as "date",
    IFNULL(NULLIF("source",''), '(direct)') as "source",
    IFNULL(NULLIF("medium",''), '(none)') as "medium",
    IFNULL(NULLIF("campaignName",''), 'uncategorized') as "campaign",
    IFNULL(NULLIF("source",''), '(direct)')||' / '||IFNULL(NULLIF("medium",''), '(none)') as "source_medium",
    COUNT(
        NULLIF(
            NULLIF("transactionId",'(not set)')
        ,'')
    ) as "ga4api_transactions"
  FROM "ga4api_t"
  GROUP BY ALL
  )

  SELECT
  	*
  FROM "users"
  FULL OUTER JOIN "transactions"
  USING ("date","source","medium","campaign","source_medium")
