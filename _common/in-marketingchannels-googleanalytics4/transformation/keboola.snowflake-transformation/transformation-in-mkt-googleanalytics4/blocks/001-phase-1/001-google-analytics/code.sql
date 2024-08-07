-- NOT collected session_id and client_id 
CREATE TABLE "out_ga4_traffic"
(
  "ga_traffic_id" VARCHAR(1024) NOT NULL,
  "sessions_new" INTEGER,
  "sessions_return" INTEGER,
  "pageviews" INTEGER,
  "bounces" INTEGER
);

INSERT INTO "out_ga4_traffic"
SELECT  
	ifnull("date",'') || '*' || ifnull("source",'') || '*' || ifnull("medium",'') || '*' || ifnull("campaign",'') || '*' || ifnull("domain",'')  || '*' || ifnull("account_id",'') || '*' || ifnull("keyword",'') || '*' || ifnull("ad_group",'') AS "ga_traffic_id"
  ,SUM("sessions_new") AS "sessions_new"
  ,SUM("sessions_return") AS "sessions_return"
  ,SUM("pageviews") AS "pageviews"
  ,SUM("bounces") AS "bounces"
FROM (
	SELECT 
  	"date"
    ,lower(iff( "sessionSource"='(not set)','',"sessionSource")) AS "source"
    ,lower(iff("sessionMedium"='(not set)','',"sessionMedium")) AS "medium"
    ,lower(iff("sessionCampaignName"='(not set)','',"sessionCampaignName")) AS "campaign"
    ,lower(substring("hostName",LENGTH("hostName")-POSITION('.' IN reverse("hostName"))+2)) AS "domain"
    ,lower("idProperty") AS "account_id" 
    ,lower("sessionGoogleAdsKeyword") AS "keyword"
    ,lower("sessionGoogleAdsAdGroupName") AS "ad_group"
    ,CASE WHEN "newVsReturning"='new' THEN to_number("sessions",35) ELSE 0 END AS "sessions_new"
    ,CASE WHEN "newVsReturning"='returning' THEN to_number("sessions",35) ELSE 0 END AS "sessions_return"
    ,"screenPageViews" AS "pageviews"
    ,to_number("sessions",35) - to_number("engagedSessions",35) as "bounces"
	FROM "ga4_basic_sessions"
		) 
WHERE ("sessions_new" + "sessions_return" + "pageviews" + "bounces") > 0
GROUP BY "date"
,"source"
,"medium"
,"campaign"
,"domain"
,"account_id"
,"keyword"
,"ad_group";

-- transaction detail
CREATE TABLE "out_ga4_transactions"
(
  "ga_transactions_id" VARCHAR(1024) NOT NULL,
  "item_quantity" INTEGER
);

INSERT INTO "out_ga4_transactions"
SELECT  
	ifnull("date",'') || '*' || ifnull("source",'') || '*' || ifnull("medium",'') || '*' || ifnull("campaign",'') || '*' || 			ifnull("domain",'')  || '*' ||
ifnull("account_id",'') || '*' || ifnull("keyword",'') || '*' || ifnull("ad_group",'')|| '*' || ifnull("transaction_id",'')   AS 	"ga_transactions_id"
	,SUM("item_quantity") AS "item_quantity"
FROM (
	SELECT 
  	"date"
    ,lower(iff( "sessionSource"='(not set)','',"sessionSource")) AS "source"
    ,lower(iff("sessionMedium"='(not set)','',"sessionMedium")) AS "medium"
    ,lower(iff("sessionCampaignName"='(not set)','',"sessionCampaignName")) AS "campaign"
    ,lower(substring("hostName",LENGTH("hostName")-POSITION('.' IN reverse("hostName"))+2)) AS "domain"
    ,lower("idProperty") AS "account_id" 
    ,lower("sessionGoogleAdsKeyword") AS "keyword"
    ,lower("sessionGoogleAdsAdGroupName") AS "ad_group"
    ,lower("transactionId") AS "transaction_id"
    ,"itemsPurchased" AS "item_quantity" 
	FROM "ga4_basic_transactions"
		) 
WHERE "item_quantity">0 
GROUP BY "date"
  ,"source"
  ,"medium"
  ,"campaign"
  ,"domain"
  ,"account_id"
  ,"keyword"
  ,"ad_group"
  ,"transaction_id";
