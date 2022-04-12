CREATE TABLE "ga_demographic_audience" AS (
  SELECT 
  --dimensions
    "id" as "id_TBE",
    "date" as "ga_date"
    ,"userAgeBracket" as "ga_userAgeBracket"
    ,"userGender" as "ga_userGender"
    ,"interestAffinityCategory" as "ga_interestAffinityCategory"
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
    "raw_demographic_audience"
  where date("date") = current_date - interval '{{ DaysToPast }} days'
  )
  ;
