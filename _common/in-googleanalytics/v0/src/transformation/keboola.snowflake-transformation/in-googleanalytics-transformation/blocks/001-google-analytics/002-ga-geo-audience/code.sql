CREATE TABLE "ga_geo_audience"
(
  "id_TBE" VARCHAR(2000) NOT NULL,
  "ga_date" DATE,
  "ga_country" VARCHAR(255),
  "ga_region" VARCHAR(255),
  "ga_latitude" FLOAT,
  "ga_longitude" FLOAT,
  "ga_channelGrouping" VARCHAR(255),
  "ga_userType" VARCHAR(255),
  "ga_source" VARCHAR(255),
  "ga_medium" VARCHAR(255),
  "ga_sessions" INTEGER,
  "ga_users" INTEGER,
  "ga_bounces" INTEGER,
  "ga_sessionDuration" FLOAT,
  "ga_pageviews" INTEGER
);


INSERT INTO "ga_geo_audience" 
  SELECT 
  -- dimensions
    "id" AS "id_TBE",
    "date" AS "ga_date"
    ,"country" "ga_country"
    ,"region" AS "ga_region"
    ,"latitude"  AS "ga_latitude"
    ,"longitude" AS "ga_longitude"
    ,"channelGrouping" AS "ga_channelGrouping"
    ,CASE WHEN "userType" = 'Returning Visitor' THEN 0 ELSE 1 END AS "ga_userType"
    ,"source" AS "ga_source"
    ,"medium" AS "ga_medium" 
    -- metrics
    ,"sessions" AS "ga_sessions"
    ,"users" AS "ga_users"
    ,"bounces" AS "ga_bounces"
    ,"sessionDuration" AS "ga_sessionDuration"
    ,"pageviews" AS "ga_pageviews"
  FROM
    "raw_geo_audience"
;
