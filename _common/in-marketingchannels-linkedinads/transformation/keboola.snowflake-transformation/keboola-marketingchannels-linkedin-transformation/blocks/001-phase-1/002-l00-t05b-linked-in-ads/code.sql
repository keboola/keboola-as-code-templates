CREATE OR REPLACE VIEW "tmp_linkedin" AS
SELECT 
   a."start_date" AS "date",
   'linkedinads' AS "source",
   lower(b."costType") AS "medium",
   lower(b."name") AS "campaign",
   '' AS "domain",
   lower(b."unitCost_currencyCode") AS "currency",
   b."account" AS "account_id",
   a."impressions" AS "impressions",
   a."clicks" AS "clicks",
   c."costInLocalCurrency" AS "costs"
FROM "linkedin_ads_basic_stats" AS a
	LEFT JOIN "linkedin_campaigns" AS b
		ON a."campaign_id"=b."campaign_id"
	LEFT JOIN "linkedin_ads_cost" c
		ON a."pk"=c."pk"
WHERE a."pivot"='CAMPAIGN' AND c."pivot"='CAMPAIGN';

-- output table grouping
CREATE OR REPLACE TABLE "out_linkedin" AS 
SELECT 
  ifnull("date",'') || '*' || ifnull("source",'') || '*' || ifnull("medium",'') || '*' || ifnull("campaign",'') || '*' || ifnull("domain",'') || '*' || ifnull("currency",'') || '*' || ifnull("account_id",'')  AS "linkedin_id"
  ,SUM("impressions") AS "impressions" 
  ,SUM("clicks") AS "clicks"
  ,SUM("costs") AS "costs"
  FROM "tmp_linkedin"
  GROUP BY "date"
  ,"source"
  ,"medium"
  ,"campaign"
  ,"domain"
  ,"currency"
  ,"account_id";
