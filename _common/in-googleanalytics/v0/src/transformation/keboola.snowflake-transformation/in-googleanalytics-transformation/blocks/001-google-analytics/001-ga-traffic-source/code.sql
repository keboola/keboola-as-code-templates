CREATE TABLE "ga_traffic_source" AS 
(
  SELECT 
    -- dimensions
    "id" AS "id_TBE",
    "userType" AS "ga_userType"
    ,"date" AS "ga_date"
    ,"campaign" AS "ga_campaign"
    ,"source" AS "ga_source"
    ,"medium" AS "ga_medium"
    ,"keyword" AS "ga_keyword"
    ,"adContent" AS "ga_adContent"
    ,"socialNetwork" AS "ga_socialNetwork"
    ,"channelGrouping" AS "ga_channelGrouping"
    -- metrics
    ,"sessions" AS "ga_sessions"
    ,"users" AS "ga_users"
    ,"bounces" AS "ga_bounces"
    ,"sessionDuration" AS "ga_sessionDuration"
    ,"pageviews" AS "ga_pageviews"
    ,"organicSearches" AS "ga_organicSearches"
  FROM
    "raw_traffic_source"
);
