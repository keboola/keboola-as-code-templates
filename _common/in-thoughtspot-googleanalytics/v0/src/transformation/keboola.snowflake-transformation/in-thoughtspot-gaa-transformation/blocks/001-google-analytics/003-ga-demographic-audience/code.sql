CREATE TABLE "ga_demographic_audience" AS 
(
  SELECT 
    --dimensions
    "id" AS "id_TBE",
    "date" AS "ga_date"
    ,"userAgeBracket" AS "ga_userAgeBracket"
    ,"userGender" AS "ga_userGender"
    ,"interestAffinityCategory" AS "ga_interestAffinityCategory"
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
    "raw_demographic_audience"
);
