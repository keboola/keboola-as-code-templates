CREATE TABLE "ga4_page_behaviour" 
(
  	"id" VARCHAR(2000) NOT NULL
  	,"idProperty" VARCHAR(255)
  	,"date" DATE
  	,"hostName" VARCHAR(255)
  	,"pagePath" VARCHAR(2000)
  	,"landingPage" VARCHAR(2000)
    ,"landingpagePlusQueryString" VARCHAR(2000)
  	,"pageTitle" VARCHAR(255)
  	,"country" VARCHAR(255)
  	,"deviceCategory" VARCHAR(255)
  	,"language" VARCHAR(255)
    ,"sessions" INTEGER
  	,"engagedSessions" INTEGER
  	,"bounces" INTEGER
  	,"activeUsers" INTEGER
  	,"newUsers" INTEGER
  	,"totalUsers" INTEGER
  	,"screenPageViews" INTEGER
  	,"conversions" INTEGER
  	,"userEngagementDuration" FLOAT
	  ,"averageSessionDuration" FLOAT
  	,"eventCount" INTEGER
);

INSERT INTO "ga4_page_behaviour" 
  SELECT 
    -- dimensions
    "id"
  	,"idProperty"
  	,"date"
  	,"hostName"
  	,"pagePath"
  	,"landingPage"
    ,"landingpagePlusQueryString"
  	,"pageTitle"
  	,"country"
  	,"deviceCategory"
  	,"language"
    -- metrics
    ,"sessions"
  	,"engagedSessions"
  	,"sessions"::INTEGER - "engagedSessions"::INTEGER as "bounces"
  	,"activeUsers"
  	,"newUsers"
  	,"totalUsers"
  	,"screenPageViews"
  	,"conversions"
  	,"userEngagementDuration"
	  ,"averageSessionDuration"
  	,"eventCount"
  FROM
    "raw_landing_page_statistics"
;
