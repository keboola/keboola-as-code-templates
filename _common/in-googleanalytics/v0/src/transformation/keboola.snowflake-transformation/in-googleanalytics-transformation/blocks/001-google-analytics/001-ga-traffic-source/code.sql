CREATE TABLE "ga_traffic_source"
(
  "id_TBE" VARCHAR(2000) NOT NULL,
  "ga_userType" VARCHAR(255),
  "ga_date" DATE,
  "ga_campaign" VARCHAR(255),
  "ga_source" VARCHAR(255),
  "ga_medium" VARCHAR(255),
  "ga_keyword" VARCHAR(255),
  "ga_adContent" VARCHAR(255),
  "ga_socialNetwork" VARCHAR(255),
  "ga_channelGrouping" VARCHAR(255),
  "ga_sessions" INTEGER,
  "ga_users" INTEGER,
  "ga_bounces" INTEGER,
  "ga_sessionDuration" FLOAT,
  "ga_pageviews" INTEGER,
  "ga_organicSearches" INTEGER
);


INSERT INTO "ga_traffic_source" 
  SELECT 
    -- dimensions
    "id" AS "id_TBE"
    ,CASE WHEN "userType" = 'Returning Visitor' THEN 0 ELSE 1 END AS "ga_userType"
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
;
