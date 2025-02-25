CREATE OR REPLACE TABLE `tmp_linkedin` AS
SELECT 
   CAST(a.start_date  AS STRING) 										AS date,
   'linkedinads' 																		AS source,
   lower(b.costType) 																AS medium,
   lower(b.name) 																		AS campaign,
   '' 																							AS domain,
   lower(b.unitCost_currencyCode) 									AS currency,
   b.account 																				AS account_id,
   CAST(a.impressions AS INT64) 										AS impressions,
   CAST(a.clicks AS INT64)  												AS clicks,
   ROUND(CAST(c.costInLocalCurrency AS NUMERIC), 3) AS costs
FROM `linkedin_ads_basic_stats` AS a
	LEFT JOIN `linkedin_campaigns` AS b
		ON a.campaign_id = b.campaign_id
	LEFT JOIN `linkedin_ads_cost` c
		ON a.pk =c.pk
WHERE a.pivot ='CAMPAIGN' AND c.pivot ='CAMPAIGN';


-- output table grouping
CREATE TABLE `out_linkedin`
(
  linkedin_id STRING NOT NULL,
  impressions INT64,
  clicks 			INT64,
  costs				NUMERIC
);

INSERT INTO `out_linkedin` 
SELECT 
 CONCAT(ifnull(date,''), '*', ifnull(source,''), '*', ifnull(medium,''), '*' , ifnull(campaign,''), '*', ifnull(domain,''), '*', ifnull(currency,''), '*', ifnull(account_id,'')) AS linkedin_id
  ,SUM(impressions) AS impressions
  ,SUM(clicks) 			AS clicks
  ,SUM(costs) 			AS costs
 FROM  `tmp_linkedin`
 GROUP BY
    date
  ,source
  ,medium
  ,campaign
  ,domain
  ,currency
  ,account_id;
