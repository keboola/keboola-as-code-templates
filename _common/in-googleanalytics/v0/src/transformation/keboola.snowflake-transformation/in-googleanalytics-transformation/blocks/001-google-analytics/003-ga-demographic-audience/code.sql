CREATE TABLE "ga_demographic_audience"
(
  "id_TBE" VARCHAR(2000) NOT NULL,
  "ga_date" DATE,
  "ga_userAgeBracket" VARCHAR(255),
  "ga_userGender" VARCHAR(255),
  "ga_interestAffinityCategory" VARCHAR(255),
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

INSERT INTO "ga_demographic_audience" 
  SELECT 
    --dimensions
    "id" AS "id_TBE",
    "date" AS "ga_date"
    ,"userAgeBracket" AS "ga_userAgeBracket"
    ,"userGender" AS "ga_userGender"
    ,"interestAffinityCategory" AS "ga_interestAffinityCategory"
    ,"channelGrouping" AS "ga_channelGrouping"
    ,"userType" AS "ga_userType"
    ,'' AS "ga_source"
    ,'' AS "ga_medium" 
    -- metrics
    ,"sessions" AS "ga_sessions"
    ,"users" AS "ga_users"
    ,"bounces" AS "ga_bounces"
    ,"sessionDuration" AS "ga_sessionDuration"
    ,"pageviews" AS "ga_pageviews"
  FROM
    "raw_demographic_audience"
;
