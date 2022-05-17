-- table with account id Labels
CREATE or replace TABLE "accounts" (
    "ads_system" STRING, 
    "account_id" STRING , 
    "account_name" STRING 
);

-- has to be edited
INSERT INTO "accounts"
VALUES ('facebook','XXXXXX','Customer_name');

-- collect all ads system in one table 
CREATE  OR REPLACE VIEW  "tmp_ads_systems" AS
SELECT ifnull("account_name",'') || '*' || ifnull("date",'') || '*' || ifnull("source",'') || '*' || ifnull("medium",'') || '*' || ifnull("campaign",'') || '*' || ifnull("domain",'') AS "id"
,sum("clicks") AS "clicks"
,sum("impressions") AS "impressions"
,sum(TO_number("costs_cpc",35,5)) AS "costs_cpc"
,sum(TO_number("costs_conversion",35,5)) AS "costs_conversion" 
FROM (
        SELECT ifnull(t2."account_name",'Others') AS "account_name"
        ,split_part("id",'*',1) AS "date"
        ,split_part("id",'*',2) AS "source"
        ,split_part("id",'*',3) AS "medium"
        ,split_part("id",'*',4) AS "campaign"
        ,split_part("id",'*',5) AS "domain"
        ,"impressions"
        ,"clicks"
        ,"costs_cpc"
        ,"costs_conversion"
        FROM (
            SELECT "facebook_ads_id" as "id"
            ,"impressions"
            ,"clicks"
            ,"costs" AS "costs_cpc"
            ,0 as "costs_conversion"
            FROM "out_facebook"
        ) t1
        LEFT JOIN "accounts" t2
        ON split_part(t1."id",'*',7) = "account_id"
    ) as t
WHERE "costs_cpc"  > 0 OR  "costs_conversion" > 0
GROUP BY "account_name","date","source","medium","campaign","domain";

-- final facebook marketing table 
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
FROM (
	SELECT "id"
	,sum("impressions") AS "impressions" 
	,sum("clicks") AS "clicks"
	,sum("costs_cpc") AS "costs_cpc"
	,sum("costs_conversion") AS "costs_conversion" 
	FROM "tmp_ads_systems"
	WHERE "id" IS NOT  NULL
	GROUP BY "id"
) as t;
