-- prepare data from ga
CREATE  VIEW "tmp_ga_pre" AS 
SELECT 
  ifnull(t2."account_name",'Others') AS "account_name"
  ,split_part("ga_traffic_id",'*',1) AS "date"
  ,split_part("ga_traffic_id",'*',2) AS "source"
  ,split_part("ga_traffic_id",'*',3) AS "medium"
  ,split_part("ga_traffic_id",'*',4) AS "campaign"
  ,split_part("ga_traffic_id",'*',5) AS "domain"
  ,split_part("ga_traffic_id",'*',7) AS "keyword"
  ,split_part("ga_traffic_id",'*',8) AS "ad_group"
  ,"sessions_new"
  ,"sessions_return"
  ,"pageviews"
  ,"bounces"
FROM "out_ga_traffic" t1
	LEFT JOIN "accounts" t2
			ON split_part(t1."ga_traffic_id",'*',6) = "account_id";

-- table with relationships between ("keyword" ,"ad_group") and ga traffic data
CREATE  VIEW "out_keyword_ad_group" AS 
SELECT DISTINCT  
	ifnull("account_name",'') || '*' || ifnull("date",'') || '*' || ifnull("source",'') || '*' ||
ifnull("medium",'') || '*' || ifnull("campaign",'') || '*' || ifnull("domain",'')  || '*' || ifnull("keyword",'') || '*' || ifnull("ad_group",'') AS "keyword_id"
	,ifnull("account_name",'') || '*' || ifnull("date",'') || '*' || ifnull("source",'') || '*' || ifnull("medium",'') || '*' || ifnull("campaign",'') || '*' || ifnull("domain",'')  AS "online_marketing_traffic_id"
	,"keyword"
	,"ad_group"
FROM "tmp_ga_pre";

-- sum ga metrics
CREATE OR REPLACE VIEW "tmp_ga" AS 	
SELECT 
	ifnull("account_name",'') || '*' || ifnull("date",'') || '*' || ifnull("source",'') || '*' || ifnull("medium",'') || '*' || ifnull("campaign",'') || '*' || ifnull("domain",'')  AS "id"
  ,SUM("sessions_new") AS "sessions_new"
  ,SUM("sessions_return") AS "sessions_return"
  ,SUM("pageviews") AS "pageviews"
  ,SUM("bounces") AS "bounces"
FROM "tmp_ga_pre"
GROUP BY 
	"account_name"
  ,"date"
  ,"source"
  ,"medium"
  ,"campaign"
  ,"domain";

-- merge ga information and costs
CREATE TABLE "tmp_marketing" AS 
SELECT COALESCE(t1."online_marketing_traffic_id",t2."id") AS "id"
  ,ifnull(t1."impressions",0) AS "impressions"
  ,ifnull(t1."clicks",0) AS "clicks"
  ,ifnull(t1."costs_cpc",0) AS "costs_cpc"
  ,ifnull(t1."costs_conversion",0) AS "costs_conversion"
  ,ifnull(t2."sessions_new",0) AS "sessions_new"
  ,ifnull(t2."sessions_return",0) AS "sessions_return"
  ,ifnull(t2."pageviews",0) AS "pageviews"
  ,ifnull(t2."bounces",0) AS "bounces"
FROM "online_marketing" t1 
	FULL OUTER  JOIN "tmp_ga" t2 
		ON t1."online_marketing_traffic_id"=t2."id";

-- final traffic table 
CREATE  TABLE "out_marketing" AS 
SELECT 
	"id" AS "online_marketing_traffic_id"
  ,split_part("id",'*',1) AS "account_name"
  ,split_part("id",'*',2) AS "date"
  ,split_part("id",'*',3) AS "source"
  ,split_part("id",'*',4) AS "medium"
  ,split_part("id",'*',5) AS "campaign"
  ,split_part("id",'*',6) AS "domain"
	,"impressions" 
	,"clicks"
	,"costs_cpc"
	,"costs_conversion" 
	,"sessions_new"
	,"sessions_return" 
	,"pageviews" 
	,"bounces"
FROM (
	SELECT 
  	"id"
    ,sum("impressions") AS "impressions" 
    ,sum("clicks") AS "clicks"
    ,sum("costs_cpc") AS "costs_cpc"
    ,sum("costs_conversion") AS "costs_conversion" 
    ,sum("sessions_new") AS "sessions_new"
    ,sum("sessions_return") AS "sessions_return" 
    ,sum("pageviews") AS "pageviews" 
    ,sum("bounces") AS "bounces"
	FROM "tmp_marketing"
	WHERE "id" IS NOT  NULL
	GROUP BY "id"
);

-- final transaction table 
CREATE VIEW "out_marketing_transactions" AS 
SELECT 
	ifnull("account_name",'') || '*' || ifnull("date",'') || '*' || ifnull("source",'') || '*' || ifnull("medium",'') || '*' || ifnull("campaign",'') || '*' || ifnull("domain",'') || '*' || ifnull("transaction_id",'') AS "online_marketing_transactions_id" 
	,ifnull("account_name",'') || '*' || ifnull("date",'') || '*' || ifnull("source",'') || '*' || ifnull("medium",'') || '*' || ifnull("campaign",'') || '*' || ifnull("domain",'') AS "online_marketing_traffic_id"  
  ,"account_name"
  ,"date"
  ,"source"
  ,"medium"
  ,"campaign"
  ,"domain"
  ,"transaction_id" 
  ,SUM("item_quantity") AS "item_quantity"
FROM (
	SELECT
  	"ga_transactions_id"
  	,"account_name"
    ,split_part("ga_transactions_id",'*',1) AS "date"
    ,split_part("ga_transactions_id",'*',2) AS "source"
    ,split_part("ga_transactions_id",'*',3) AS "medium"
    ,split_part("ga_transactions_id",'*',4) AS "campaign"
    ,split_part("ga_transactions_id",'*',5) AS "domain"
    ,split_part("ga_transactions_id",'*',9) AS "transaction_id"
    ,"item_quantity"
	FROM "out_ga_transactions" t1
		LEFT JOIN "accounts" t2
			ON split_part(t1."ga_transactions_id",'*',6) = "account_id"
			)
GROUP BY 
  "account_name"
  ,"date"
  ,"source"
  ,"medium"
  ,"campaign"
  ,"domain"
  ,"transaction_id";
