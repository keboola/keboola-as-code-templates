CREATE TABLE "ga4_audience"
(
  	"id" VARCHAR(2000) NOT NULL
    ,"idProperty" VARCHAR(255)
    ,"date" DATE
    ,"audienceId" VARCHAR(255)
    ,"audienceName" VARCHAR(255)
    ,"activeUsers" INTEGER
    ,"newUsers" INTEGER
    ,"totalUsers" INTEGER
    ,"sessions" INTEGER
    ,"engagedSessions" INTEGER
    ,"screenPageViews" INTEGER
    ,"averageSessionDuration" FLOAT
    ,"userEngagementDuration" FLOAT
);

INSERT INTO "ga4_audience"
	SELECT
  --dimensions
  	"id"
    ,"idProperty"
    ,"date"
    ,"audienceId"
    ,"audienceName"
  --metrics
  	,"activeUsers"
    ,"newUsers"
    ,"totalUsers"
    ,"sessions"
    ,"engagedSessions"
    ,"screenPageViews"
    ,"averageSessionDuration"
    ,"userEngagementDuration"
  FROM "raw_audience"
;
