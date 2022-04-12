CREATE TABLE "ga_traffic_source" AS (
  SELECT 
  -- dimensions
    "id" as "id_TBE",
    "userType" as "ga_userType"
    ,"date" as "ga_date"
    ,"campaign" as "ga_campaign"
    ,"source" as "ga_source"
    ,"medium" as "ga_medium"
    ,"keyword" as "ga_keyword"
    ,"adContent" as "ga_adContent"
    ,"socialNetwork" as "ga_socialNetwork"
    ,"channelGrouping" as "ga_channelGrouping"
    -- metrics
    ,"sessions" as "ga_sessions"
    ,"users" as "ga_users"
    ,"bounces" as "ga_bounces"
    ,"sessionDuration" as "ga_sessionDuration"
    ,"pageviews" as "ga_pageviews"
    ,"organicSearches" as "ga_organicSearches"
  from
    "raw_traffic_source"
  where date("date") = current_date - interval '{{ DaysToPast }} days'
)
  ;
