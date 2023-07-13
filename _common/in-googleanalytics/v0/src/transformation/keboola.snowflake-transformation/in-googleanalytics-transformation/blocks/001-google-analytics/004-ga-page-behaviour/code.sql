CREATE TABLE "ga_page_behaviour"
(
  "id_TBE" VARCHAR(2000) NOT NULL,
  "ga_date" DATE,
  "ga_hostname" VARCHAR(255),
  "ga_pagePath" VARCHAR(2000),
  "ga_landingPagePath" VARCHAR(2000),
  "ga_secondPagePath" VARCHAR(2000),
  "ga_exitPagePath" VARCHAR(2000),
  "ga_pageTitle" VARCHAR(2000),
  "ga_source" VARCHAR(2000),
  "ga_country" VARCHAR(255),
  "ga_sessions" INTEGER,
  "ga_entrances" INTEGER,
  "ga_pageviews" INTEGER,
  "ga_timeOnPage" FLOAT,
  "ga_exits" INTEGER,
  "ga_pageValue" FLOAT
);

INSERT INTO "ga_page_behaviour" 
  SELECT 
    -- dimensions
    "id" AS "id_TBE",
    "date" AS "ga_date"
    ,"hostname" AS "ga_hostname"
    ,"pagePath" AS "ga_pagePath"
    ,"landingPagePath" AS "ga_landingPagePath"
    ,"secondPagePath" AS "ga_secondPagePath"
    ,"exitPagePath" AS "ga_exitPagePath"
    ,"pageTitle" AS "ga_pageTitle"
    ,"source" AS "ga_source"
    ,"country" AS "ga_country"
    -- metric
    ,nullif("sessions",'') AS "ga_sessions"
    ,nullif("entrances",'') AS "ga_entrances"
    ,nullif("pageviews",'') AS "ga_pageviews"
    ,nullif("timeOnPage",'') AS "ga_timeOnPage"
    ,nullif("exits",'') AS "ga_exits"
    ,nullif("pageValue",'') AS "ga_pageValue"
  FROM
    "raw_page_behaviour"
;