CREATE TABLE "ga_site_statistics"
(
  "id_TBE" VARCHAR(2000) NOT NULL,
  "ga_date" DATE,
  "ga_time" VARCHAR(255),
  "ga_hostname" VARCHAR(255),
  "ga_pagePath" VARCHAR(1024),
  "ga_country" VARCHAR(255),
  "ga_browser" VARCHAR(255),
  "ga_operatingSystemVersion" VARCHAR(255),
  "ga_deviceCategory" VARCHAR(255),
  "ga_operatingSystem" VARCHAR(255),
  "ga_language" VARCHAR(255),
  "ga_sessions" INTEGER,
  "ga_pageviews" INTEGER,
  "ga_avgPageLoadTime" FLOAT,
  "ga_avgPageDownloadTime" FLOAT,
  "ga_avgRedirectionTime" FLOAT,
  "ga_avgServerConnectionTime" FLOAT,
  "ga_serverResponseTime" INTEGER
);


INSERT INTO "ga_site_statistics" 
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
;
