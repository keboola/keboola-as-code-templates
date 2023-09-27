CREATE TABLE "ga4_demographic_audience"
(
   	"id" VARCHAR(2000) NOT NULL
    ,"idProperty" VARCHAR(255)
    ,"date" DATE
    ,"userAgeBracket" VARCHAR(255)
    ,"userGender" VARCHAR(255)
    ,"language" VARCHAR(255)
    ,"channelGrouping" VARCHAR(255)
    ,"userType" VARCHAR(255)
    ,"sessions" INTEGER
    ,"engagedSessions" INTEGER
    ,"bounces" INTEGER
    ,"activeUsers" INTEGER
    ,"newUsers" INTEGER
    ,"totalUsers" INTEGER
    ,"conversions" INTEGER
    ,"userEngagementDuration" FLOAT
    ,"averageSessionDuration" FLOAT
    ,"screenPageViews" INTEGER
    ,"eventCount" INTEGER
);

INSERT INTO "ga4_demographic_audience"
  SELECT 
    --dimensions
    "id"
    ,"idProperty"
    ,"date"
    ,"userAgeBracket"
    ,"userGender"
    ,"language"
    ,"sessionDefaultChannelGrouping" as "channelGrouping"
    ,"newVsReturning" as "userType"
    -- metrics
    ,"sessions"
    ,"engagedSessions"
    ,"sessions"::INTEGER - "engagedSessions"::INTEGER as "bounces"
    ,"activeUsers"
    ,"newUsers"
    ,"totalUsers"
    ,"conversions"
    ,"userEngagementDuration"
    ,"averageSessionDuration"
    ,"screenPageViews"
    ,"eventCount"
  FROM
    "raw_demographic"
;
