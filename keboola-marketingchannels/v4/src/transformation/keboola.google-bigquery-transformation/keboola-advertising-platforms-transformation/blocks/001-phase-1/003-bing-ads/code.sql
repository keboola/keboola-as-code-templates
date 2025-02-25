CREATE OR REPLACE TABLE `tmp_bing_new` AS 
SELECT 
  a.TimePeriod 												AS date
  ,'BingAds' 													AS source
  ,lower(b.Bid_Strategy_Type) 				AS medium
  ,lower(a.CampaignName) 							AS campaign
  ,lower(NET.PUBLIC_SUFFIX(b.Domain)) AS domain
  ,lower(a.CurrencyCode) 							AS currency
  ,lower(a.AccountId) 								AS account_id
  ,CAST(a.Impressions AS INT64) 			AS impressions
  ,CAST(a.Clicks AS INT64) 						AS clicks
  ,ROUND(CAST(a.Spend AS NUMERIC), 3) AS costs
FROM `Bing_Ads_campaignperformance` AS a
	INNER JOIN `Bing_Ads_campaigns` AS b
		ON a.CampaignId =b.Id ;


-- output table grouping
CREATE TABLE `out_bingads` 
(
  bing_id 		STRING NOT NULL,
  impressions INT64,
  clicks 			INT64,
  costs 			NUMERIC
);

INSERT INTO `out_bingads`
SELECT 
   CONCAT(ifnull(date,''), '*', ifnull(source,''), '*', ifnull(medium,''), '*' , ifnull(campaign,''), '*', ifnull(domain,''), '*', ifnull(currency,''), '*', ifnull(account_id,'')) AS bing_id
  ,SUM(impressions) AS impressions 
  ,SUM(clicks) 			AS clicks
  ,SUM(costs) 			AS costs
FROM `tmp_bing_new`
GROUP BY 
   date
  ,source
  ,medium
  ,campaign
  ,domain
  ,currency
  ,account_id;
