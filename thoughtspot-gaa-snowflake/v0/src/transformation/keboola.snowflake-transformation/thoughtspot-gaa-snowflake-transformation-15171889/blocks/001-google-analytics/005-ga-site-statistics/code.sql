CREATE TABLE "ga_site_statistics" AS (
  SELECT 
  -- dimensions
    "id" as "id_TBE",
    TO_DATE(left("dateHourMinute",8)::string,'YYYYMMDD') as "ga_date"
    ,TO_TIME(right("dateHourMinute"::string,4)::string,'HH24MI') as "ga_time"
    ,"hostname" as "ga_hostname"
    ,"pagePath" as "ga_pagePath"
    ,"country" as "ga_country"
    ,"browser" as "ga_browser"
    ,"operatingSystemVersion" as "ga_operatingSystemVersion"
    ,"deviceCategory" as "ga_deviceCategory"
    ,"operatingSystem" as "ga_operatingSystem"
    ,"language" as "ga_language"
    -- metrics
    ,"sessions" as "ga_sessions"
    ,"pageviews" as "ga_pageviews"
    ,"avgPageLoadTime" as "ga_avgPageLoadTime"
    ,"avgPageDownloadTime" as "ga_avgPageDownloadTime"
    ,"avgRedirectionTime" as "ga_avgRedirectionTime"
    ,"avgServerConnectionTime" as "ga_avgServerConnectionTime"
    ,"serverResponseTime"as "ga_serverResponseTime"
  from
    "raw_site_statistics"
  where date(TO_CHAR(TO_DATE(left("dateHourMinute",8)::string,'YYYYMMDD'),'YYYY-MM-DD')) = current_date - interval '{{ DaysToPast }} days'
  )
  ;
