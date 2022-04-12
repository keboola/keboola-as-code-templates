CREATE TABLE "ga_page_behaviour" AS (
  SELECT 
  -- dimensions
    "id" as "id_TBE",
    "date" as "ga_date"
    ,"hostname" as "ga_hostname"
    ,"pagePath" as "ga_pagePath"
    ,"landingPagePath" as "ga_landingPagePath"
    ,"secondPagePath" as "ga_secondPagePath"
    ,"exitPagePath" as "ga_exitPagePath"
    ,"pageTitle" as "ga_pageTitle"
    ,"source" as "ga_source"
    ,"country" as "ga_country"
    -- metric
    ,"sessions" as "ga_sessions"
    ,"entrances" as "ga_entrances"
    ,"pageviews" as "ga_pageviews"
    ,"timeOnPage" as "ga_timeOnPage"
    ,"exits" as "ga_exits"
    ,"pageValue" as "ga_pageValue"
  from
    "raw_page_behaviour"
  where date("date") = current_date - interval '{{ DaysToPast }} days'
  )
  ;
