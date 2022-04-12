CREATE TABLE "ga_ad_analytics" AS (
  SELECT 
  --domensions
    "id" as "id_TBE",
    "date" as "ga_date"
    ,"adGroup" as "ga_adGroup"
    ,"adContent" as "ga_adContent"
    ,"adDistributionNetwork" as "ga_adDistributionNetwork"
    ,"campaign" as "ga_campaign"
    ,"adSlot" as "ga_adSlot"
    -- metrics
    ,"impressions" as "ga_impressions"
    ,"adClicks" as "ga_adClicks"
    ,"adCost" as "ga_adCost"
    ,"CPM" as "ga_CPM"
    ,"CPC" as "ga_CPC"
    ,"transactionRevenue" as "ga_transactionRevenue"
    ,"sessions" as "ga_sessions"
    ,"bounces" as "ga_bounces"
    ,"users" as "ga_users"
   ,"pageviews" as "ga_pageviews"
  from
    "raw_ad_analytics"
  where date("date") = current_date - interval '{{ DaysToPast }} days'
  )
  ;
