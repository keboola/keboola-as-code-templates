-- parse "url_tags" field function
-- PARSE_UTM ( tag you need to parse, "url_tags" field)
CREATE TEMP FUNCTION PARSE_UTM(utm STRING,trg_str STRING ) 
 RETURNS STRING AS (
	case when STRPOS(trg_str, utm) > 0 then 
    	case when STRPOS( substring(trg_str, STRPOS(trg_str, utm)), '&') > 0 then 
            	left(substring(trg_str,STRPOS(trg_str, utm)+length(utm) + 1),STRPOS(substring(trg_str,STRPOS(trg_str,utm) + length(utm) + 1),'&') -1)
         	else 
            substring(trg_str,STRPOS(trg_str, utm) + length(utm) + 1)
         end             
 	else null 
 	end
);

-- parse "url_tags" field function


CREATE OR REPLACE TABLE `tmp_utm` as 
SELECT DISTINCT parent_id
	,PARSE_UTM('utm_source',url_tags) 	as source
	,PARSE_UTM('utm_medium',url_tags) 	as medium
	,PARSE_UTM('utm_campaign',url_tags) as campaign
FROM `Facebook_Ads_ads_insights_adcreatives`;



-- join all source tables in one
-- create UTM tags (see also query and function above)
CREATE OR REPLACE TABLE `tmp_facebook` AS 
SELECT 
	lower(acc.account_id) 																									AS account_id
  ,lower(acc.currency) 																										AS currency
  ,i.date_start 																													AS date
  ,lower(ifnull(utm.source,'facebook')) 																	AS source
  ,lower(ifnull(utm.medium,'cpc')) 																				AS medium
  ,lower(CASE WHEN utm.campaign='{{campaign.name}}' THEN cmp.name
  					WHEN utm.campaign ='{{adset.name}}' THEN `as`.name
   					ELSE ifnull(utm.campaign,cmp.name)  
        END) 																															AS campaign
  ,'' 																																		AS domain
  ,CAST(i.impressions AS INT64) AS impressions
  ,CAST(IF(i.inline_link_clicks = '','0',i.inline_link_clicks ) AS INT64) AS clicks
  ,ROUND(CAST(i.spend as NUMERIC), 3) 																		AS costs
FROM `Facebook_Ads_ads_insights` i
  LEFT JOIN `Facebook_Ads_ads` AS a
  	ON i.ad_id = a.id
  LEFT JOIN `Facebook_Ads_adsets` AS `as`
  	ON a.adset_id = `as`.id
  LEFT JOIN `tmp_utm` utm 
  	ON  a.id = utm.parent_id
  LEFT JOIN `Facebook_Ads_campaigns` AS cmp
  	ON `as`.campaign_id = cmp.id
  LEFT JOIN `Facebook_Ads_accounts` AS acc 
  	ON cmp.ex_account_id = acc.id;
 

-- final output table
CREATE TABLE `out_facebook`
(
  facebook_ads_id STRING NOT NULL,
  impressions 		INT64,
  clicks 					INT64,
  costs 					NUMERIC
);

INSERT INTO `out_facebook`
SELECT 
  CONCAT(ifnull(date,''), '*', ifnull(source,''), '*', ifnull(medium,''), '*' , ifnull(campaign,''), '*', ifnull(domain,''), '*', ifnull(currency,''), '*', ifnull(account_id,'')) AS facebook_ads_id
  ,SUM(impressions) AS impressions
  ,SUM(clicks) 			AS clicks
  ,SUM(costs) 			AS costs
FROM `tmp_facebook`
GROUP BY 
   date
  ,domain
  ,source
  ,medium
  ,campaign
  ,account_id
  ,currency;
