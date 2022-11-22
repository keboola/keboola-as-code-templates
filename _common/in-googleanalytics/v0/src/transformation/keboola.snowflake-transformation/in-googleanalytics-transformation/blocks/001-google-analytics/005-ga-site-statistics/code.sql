CREATE TABLE "ga_site_statistics" AS 
(
  SELECT 
    -- dimensions
    "id" AS "id_TBE",
    TO_DATE(left("dateHourMinute",8)::string,'YYYYMMDD') AS "ga_date"
    ,TO_TIME(right("dateHourMinute"::string,4)::string,'HH24MI') AS "ga_time"
    ,"hostname" AS "ga_hostname"
    ,"pagePath" AS "ga_pagePath"
    ,"country" AS "ga_country"
    ,"browser" AS "ga_browser"
    ,"operatingSystemVersion" AS "ga_operatingSystemVersion"
    ,"deviceCategory" AS "ga_deviceCategory"
    ,"operatingSystem" AS "ga_operatingSystem"
    ,"language" AS "ga_language"
    -- metrics
    ,"sessions" AS "ga_sessions"
    ,"pageviews" AS "ga_pageviews"
    ,"avgPageLoadTime" AS "ga_avgPageLoadTime"
    ,"avgPageDownloadTime" AS "ga_avgPageDownloadTime"
    ,"avgRedirectionTime" AS "ga_avgRedirectionTime"
    ,"avgServerConnectionTime" AS "ga_avgServerConnectionTime"
    ,"serverResponseTime"AS "ga_serverResponseTime"
  FROM
    "raw_site_statistics"
);
