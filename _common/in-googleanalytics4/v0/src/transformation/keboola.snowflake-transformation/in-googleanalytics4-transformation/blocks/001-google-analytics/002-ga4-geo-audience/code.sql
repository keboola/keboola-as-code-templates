CREATE TABLE "ga4_geo_audience"
(	 	
  	"id" VARCHAR(2000) NOT NULL
  	,"idProperty" VARCHAR(255)
  	,"date" DATE
  	,"city" VARCHAR(255)
  	,"country" VARCHAR(255)
  	,"region" VARCHAR(255)
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

INSERT INTO "ga4_geo_audience" 
  SELECT 
  -- dimensions
    "id"
  	,"idProperty"
  	,"date"
  	,"city"
  	,"country"
  	,"region"
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
    "raw_geo_audience"
;
