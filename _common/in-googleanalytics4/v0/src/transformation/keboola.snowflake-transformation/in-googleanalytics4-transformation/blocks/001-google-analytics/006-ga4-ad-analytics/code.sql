CREATE TABLE "ga4_ad_analytics"
(
 		"id" VARCHAR(2000) NOT NULL
    ,"idProperty" VARCHAR(255)
    ,"date" DATE
  	,"adGroup" VARCHAR(255)
  	,"adNetworkType" VARCHAR(255)
  	,"campaign" VARCHAR(255)
  	,"adImpressions" INTEGER
  	,"adClicks" INTEGER
  	,"adCost" FLOAT
  	,"adCPC" FLOAT
  	,"averagePurchaseRevenue" FLOAT
  	,"sessions" INTEGER
    ,"engagedSessions" INTEGER
  	,"bounces" INTEGER
   	,"conversions" INTEGER
		,"activeUsers" INTEGER
    ,"screenPageViews" INTEGER
);

INSERT INTO "ga4_ad_analytics"
  SELECT 
    --dimensions
    "id"
    ,"idProperty"
    ,"date"
    ,"sessionGoogleAdsAdGroupName" as "adGroup"
    ,"sessionGoogleAdsAdNetworkType" as "adNetworkType"
    ,"sessionGoogleAdsCampaignName" as "campaign"
    -- metrics
    ,"advertiserAdImpressions" AS "adImpressions"
    ,"advertiserAdClicks" AS "adClicks"
    ,"advertiserAdCost" AS "adCost"
    ,"advertiserAdCostPerClick" as "adCPC"
    ,"averagePurchaseRevenue"
    ,"sessions"
    ,"engagedSessions"
    ,"sessions"::INTEGER - "engagedSessions"::INTEGER as "bounces"
    ,"conversions"
		,"activeUsers"
    ,"screenPageViews"
  FROM
    "raw_ad_analytics"
;
