CREATE TABLE "ga_geo_audience" AS 
(
  SELECT 
    -- dimensions
    "id" AS "id_TBE",
    "date" AS "ga_date"
    ,"country" "ga_country"
    ,"region" AS "ga_region"
    ,"latitude"  AS "ga_latitude"
    ,"longitude" AS "ga_longitude"
    ,"channelGrouping" AS "ga_channelGrouping"
    ,"userType" AS "ga_userType"
    ,"source" AS "ga_source"
    ,"medium" AS "ga_medium" 
    -- metrics
    ,"sessions" AS "ga_sessions"
    ,"users" AS "ga_users"
    ,"bounces" AS "ga_bounces"
    ,"sessionDuration" AS "ga_sessionDuration"
    ,"pageviews" AS "ga_pageviews"
  FROM
    "raw_geo_audience"
  WHERE date("date") = current_date - interval '{{ DaysToPast }} days'
);
