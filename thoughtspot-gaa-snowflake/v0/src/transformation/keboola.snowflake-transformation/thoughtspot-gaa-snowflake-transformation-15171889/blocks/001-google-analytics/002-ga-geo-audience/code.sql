CREATE TABLE "ga_geo_audience" AS (
  SELECT 
  -- dimensions
    "id" as "id_TBE",
    "date" as "ga_date"
    ,"country" "ga_country"
    ,"region" as "ga_region"
    ,"latitude"  as "ga_latitude"
    ,"longitude" as "ga_longitude"
    ,"channelGrouping" as "ga_channelGrouping"
    ,"userType" as "ga_userType"
    ,"source" as "ga_source"
    ,"medium" as "ga_medium" 
    -- metrics
    ,"sessions" as "ga_sessions"
    ,"users" as "ga_users"
    ,"bounces" as "ga_bounces"
    ,"sessionDuration" as "ga_sessionDuration"
    ,"pageviews" as "ga_pageviews"
  from
    "raw_geo_audience"
  where date("date") = current_date - interval '{{ DaysToPast }} days'
  );
