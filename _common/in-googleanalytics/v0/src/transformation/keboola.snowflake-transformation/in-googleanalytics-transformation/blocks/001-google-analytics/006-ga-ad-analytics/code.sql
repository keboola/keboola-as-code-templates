CREATE TABLE "ga_ad_analytics" 
(
  "id_TBE" VARCHAR(2000) NOT NULL,
  "ga_date" DATE,
  "ga_adGroup" VARCHAR(255),
  "ga_adContent" VARCHAR(255),
  "ga_adDistributionNetwork" VARCHAR(255),
  "ga_campaign" VARCHAR(255),
  "ga_adSlot" VARCHAR(255),
  "ga_impressions" INTEGER,
  "ga_adClicks" INTEGER,
  "ga_adCost" FLOAT,
  "ga_CPM" FLOAT,
  "ga_CPC" FLOAT,
  "ga_transactionRevenue" FLOAT,
  "ga_sessions" INTEGER,
  "ga_bounces" INTEGER,
  "ga_users" INTEGER,
  "ga_pageviews" INTEGER
);


INSERT INTO "ga_ad_analytics" 
  SELECT 
    --dimensions
    "id" AS "id_TBE",
    "date" AS "ga_date"
    ,"adGroup" AS "ga_adGroup"
    ,"adContent" AS "ga_adContent"
    ,"adDistributionNetwork" AS "ga_adDistributionNetwork"
    ,"campaign" AS "ga_campaign"
    ,"adSlot" AS "ga_adSlot"
    -- metrics
    ,"impressions" AS "ga_impressions"
    ,"adClicks" AS "ga_adClicks"
    ,"adCost" AS "ga_adCost"
    ,"CPM" AS "ga_CPM"
    ,"CPC" AS "ga_CPC"
    ,"transactionRevenue" AS "ga_transactionRevenue"
    ,"sessions" AS "ga_sessions"
    ,"bounces" AS "ga_bounces"
    ,"users" AS "ga_users"
    ,"pageviews" AS "ga_pageviews"
  FROM
    "raw_ad_analytics"
;
