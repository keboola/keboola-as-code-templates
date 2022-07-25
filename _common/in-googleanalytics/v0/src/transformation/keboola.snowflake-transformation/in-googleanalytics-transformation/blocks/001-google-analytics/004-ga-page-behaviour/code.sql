CREATE TABLE "ga_page_behaviour" AS 
(
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
    ,"sessions" AS "ga_sessions"
    ,"entrances" AS "ga_entrances"
    ,"pageviews" AS "ga_pageviews"
    ,"timeOnPage" AS "ga_timeOnPage"
    ,"exits" AS "ga_exits"
    ,"pageValue" AS "ga_pageValue"
  FROM
    "raw_page_behaviour"
);
