CREATE TABLE "ga4_traffic_source"
(
  "id" VARCHAR(2000) NOT NULL
  ,"idProperty" VARCHAR(255)
  ,"date" DATE
  ,"campaign" VARCHAR(2000)
  ,"medium" VARCHAR(255)
  ,"source" VARCHAR(255)
	,"userType" VARCHAR(255)
  ,"channelGrouping" VARCHAR(255)
  ,"sessions" INTEGER
  ,"engagedSessions" INTEGER
  ,"bounces" INTEGER
  ,"activeUsers" INTEGER
  ,"newUsers" INTEGER
  ,"totalUsers" INTEGER
  ,"userEngagementDuration" FLOAT
  ,"averageSessionDuration" FLOAT
  ,"screenPageViews" INTEGER
  ,"conversions" INTEGER
  ,"eventCount" INTEGER
);

INSERT INTO "ga4_traffic_source" 
  SELECT 
    -- dimensions
    "id"
  	,"idProperty"
  	,"date"
  	,"sessionCampaignName" as "campaign"
  	,"sessionMedium" as "medium"
  	,"sessionSource" as "source"
  	,"newVsReturning" as "userType"
  	,"sessionDefaultChannelGrouping" as "channelGrouping"
    -- metrics
    ,"sessions"
    ,"engagedSessions"
    ,"sessions"::INTEGER - "engagedSessions"::INTEGER as "bounces"
  	,"activeUsers"
  	,"newUsers"
  	,"totalUsers"
  	,"userEngagementDuration"
  	,"averageSessionDuration"
  	,"screenPageViews"
  	,"conversions"
  	,"eventCount"
  FROM
    "raw_traffic_acquisition"
;
