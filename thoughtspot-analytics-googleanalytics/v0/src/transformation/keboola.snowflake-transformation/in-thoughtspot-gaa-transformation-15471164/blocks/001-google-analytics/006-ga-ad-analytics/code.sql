CREATE TABLE "ga_ad_analytics" AS 
(
  SELECT 
    --dimensions
    "id" AS "id_TBE",
    "date" AS "ga_date"
    ,"adGroup" AS "ga_adGroup"
    ,"adContent" AS "ga_adContent"
    ,"adDistributionNetwork" AS "ga_adDistributionNetwork"
    ,"campaign" AS "ga_campaign"
    ,"adSlot" AS "ga_adSlot"
    -- metrics
    ,"impressions" AS "ga_impressions"
    ,"adClicks" AS "ga_adClicks"
    ,"adCost" AS "ga_adCost"
    ,"CPM" AS "ga_CPM"
    ,"CPC" AS "ga_CPC"
    ,"transactionRevenue" AS "ga_transactionRevenue"
    ,"sessions" AS "ga_sessions"
    ,"bounces" AS "ga_bounces"
    ,"users" AS "ga_users"
   ,"pageviews" AS "ga_pageviews"
  FROM
    "raw_ad_analytics"
  WHERE date("date") = current_date - interval '{{ DaysToPast }} days'
);
