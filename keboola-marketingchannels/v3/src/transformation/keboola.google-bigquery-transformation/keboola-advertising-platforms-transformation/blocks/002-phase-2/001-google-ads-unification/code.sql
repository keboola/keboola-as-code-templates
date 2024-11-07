CREATE TABLE IF NOT EXISTS  `accounts`(
 ads_system STRING   NOT NULL,
 account_id STRING   NOT NULL,
 account_name STRING NOT NULL);

INSERT INTO  `accounts` (ads_system, account_id, account_name) 
SELECT 
  'adwords' as ads_system, 
  id, 
  descriptiveName
FROM `Google_Adwords_customers`;



-- collect all ads system in one table 
CREATE OR REPLACE TABLE  `tmp_ads_systems` AS
SELECT 
   CONCAT(ifnull(account_name,''),'*', ifnull(date,''), '*', ifnull(source,''),'*', ifnull(medium,''),'*', ifnull(campaign,''), '*', ifnull(domain,'')) AS id
  ,SUM(clicks)           AS clicks
  ,SUM(impressions)      AS impressions
  ,SUM(costs_cpc)        AS costs_cpc
  ,SUM(costs_conversion) AS costs_conversion
FROM (
	SELECT 
  	ifnull(t2.account_name,'Others') AS account_name
    ,SPLIT(id, '*')[SAFE_OFFSET(0)] AS date
    ,SPLIT(id, '*')[SAFE_OFFSET(1)] AS source
    ,SPLIT(id, '*')[SAFE_OFFSET(2)] AS medium
    ,SPLIT(id, '*')[SAFE_OFFSET(3)] AS campaign
    ,SPLIT(id, '*')[SAFE_OFFSET(4)] AS domain
    ,impressions
    ,clicks
    ,costs_cpc
    ,costs_conversion
	FROM (
		SELECT 
    	adwords_id   AS id
      ,impressions
      ,clicks
      ,costs       AS costs_cpc
	  ,0 AS costs_conversion
		FROM `out_adwords`
    		) t1
	LEFT JOIN `accounts` t2
		ON SPLIT(t1.id,'*')[SAFE_OFFSET(6)] = account_id
			)			
WHERE costs_cpc  > 0 OR  costs_conversion > 0
GROUP BY 
  account_name
  ,date
  ,source
  ,medium
  ,campaign
  ,domain
;

-- final facebook marketing table 
CREATE TABLE IF NOT EXISTS `out_marketing`
(
  online_marketing_traffic_id STRING NOT NULL,
  account_name      STRING,
  date              DATE,
  source            STRING,
  medium            STRING,
  campaign          STRING,
  domain            STRING,
  impressions       INT64,
  clicks            INT64,
  costs_cpc         NUMERIC,
  costs_conversion  NUMERIC
);

INSERT INTO `out_marketing`  
SELECT 
    id AS online_marketing_traffic_id
    ,split(id,'*')[SAFE_OFFSET(0)] AS account_name
    ,CAST(split(id,'*')[SAFE_OFFSET(1)] AS DATE FORMAT 'YYYY-MM-DD') AS date
    ,split(id,'*')[SAFE_OFFSET(2)] AS source
    ,split(id,'*')[SAFE_OFFSET(3)] AS medium
    ,split(id,'*')[SAFE_OFFSET(4)] AS campaign
    ,split(id,'*')[SAFE_OFFSET(5)] AS domain
    ,impressions 
    ,clicks
    ,costs_cpc
    ,costs_conversion 
FROM (
	SELECT 
  	id
    ,SUM(impressions)      AS impressions 
    ,SUM(clicks)           AS clicks
    ,SUM(costs_cpc)        AS costs_cpc
    ,SUM(costs_conversion) AS costs_conversion
	FROM `tmp_ads_systems` 
	WHERE id IS NOT  NULL
	GROUP BY id
			) AS t;
