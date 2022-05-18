-- join all source tables in one
-- create UTM tags (see also query and function above)
-- costs have to be adjusted (divided by 1mil units)
CREATE VIEW "tmp_adwords" AS 
SELECT 
  a."segmentsDate" AS "date"
  ,'google' as "source"
  ,'cpc'  AS "medium"
  ,lower(c."name") AS "campaign"
  ,lower(RIGHT(parse_url("landingPageViewUnexpandedFinalUrl",1):"host"::string,2)) AS "domain"
  ,lower(b."currencyCode") AS "currency"
  ,lower(b."id")  AS "account_id" 
  ,a."metricsImpressions" AS "impressions"
  ,a."metricsClicks" AS "clicks"
  ,round(to_number(a."metricsCostMicros",35,5)/1000000,3) AS "costs"
FROM "Google_Adwords_ad_groups" AS a
	LEFT JOIN "Google_Adwords_campaigns" AS c 
		ON a."campaignId"=c."id"
	LEFT JOIN "Google_Adwords_customers" AS b 
		ON c."customerId"=b."id"
	LEFT JOIN "Google_Adwords_url_adwords" "d"
		ON a."campaignId"="d"."campaignId" AND a."adGroupId"="d"."adGroupId" AND a."segmentsDate"="d"."segmentsDate";

-- output table grouping
CREATE TABLE "out_adwords" AS 
SELECT
	ifnull("date",'') || '*' || ifnull("source",'') || '*' || ifnull("medium",'') || '*' || ifnull("campaign",'') || '*' || ifnull("domain",'') || '*' || ifnull("currency",'') || '*' || ifnull("account_id",'')  AS "adwords_id"
  ,SUM("impressions") AS "impressions" 
  ,SUM("clicks") AS "clicks"
  ,SUM("costs") AS "costs"
FROM "tmp_adwords"
GROUP BY 
	"date"
  ,"source"
  ,"medium"
  ,"campaign"
  ,"domain"
  ,"currency"
  ,"account_id";
