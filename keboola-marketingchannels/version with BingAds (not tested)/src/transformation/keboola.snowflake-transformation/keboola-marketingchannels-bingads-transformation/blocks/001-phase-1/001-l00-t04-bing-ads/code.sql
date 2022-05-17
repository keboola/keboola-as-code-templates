CREATE OR REPLACE VIEW "tmp_bing_new" AS 
SELECT 
  a."TimePeriod" AS "date"
  ,'BingAds' AS "source"
  ,lower(b."Bid_Strategy_Type") AS "medium"
  ,lower(a."CampaignName") AS "campaign"
  ,lower(b."Domain") AS "domain"
  ,lower(a."CurrencyCode") AS "currency"
  ,lower(a."AccountId") AS "account_id"
  ,a."Impressions" AS "impressions"
  ,a."Clicks" AS "clicks"
  ,a."Spend" AS "costs"
FROM "Bing_Ads_campaignperformance" AS a
	INNER JOIN "Bing_Ads_campaigns" AS b
		ON a."CampaignId"=b."Id" ;

-- output table grouping
CREATE TABLE "out_bingads" AS 
SELECT 
	ifnull("date",'') || '*' || ifnull("source",'') || '*' || ifnull("medium",'') || '*' || ifnull("campaign",'') || '*' || ifnull("domain",'') || '*' || ifnull("currency",'') || '*' || ifnull("account_id",'')  AS "bing_id"
  ,SUM("impressions") AS "impressions" 
  ,SUM("clicks") AS "clicks"
  ,SUM("costs") AS "costs"
FROM "tmp_bing_new"
GROUP BY 
  "date"
  ,"source"
  ,"medium"
  ,"campaign"
  ,"domain"
  ,"currency"
  ,"account_id";
