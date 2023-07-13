-- table with account id Labels
CREATE OR REPLACE TABLE "accounts" (
    "ads_system" STRING NOT NULL, 
    "account_id" STRING NOT NULL, 
    "account_name" STRING NOT NULL
);

INSERT INTO "accounts" ("ads_system","account_id","account_name") 
SELECT 'facebook' as "ads_system", 
        "account_id", 
        "name"
FROM "Facebook_Ads_accounts";

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
            SELECT "facebook_ads_id" AS "id"
            ,"impressions"
            ,"clicks"
            ,"costs" AS "costs_cpc"
            ,0 AS "costs_conversion"
            FROM "out_facebook"
        ) t1
        LEFT JOIN "accounts" t2
        ON split_part(t1."id",'*',7) = "account_id"
    ) as t
WHERE "costs_cpc"  > 0 OR  "costs_conversion" > 0
GROUP BY "account_name","date","source","medium","campaign","domain";

-- final facebook marketing table 
CREATE  TABLE "out_marketing"
(
  "online_marketing_traffic_id" VARCHAR(1024) NOT NULL,
  "account_name" VARCHAR(255),
  "date" DATE,
  "source" VARCHAR(255),
  "medium" VARCHAR(255),
  "campaign" VARCHAR(255),
  "domain" VARCHAR(255),
  "impressions" INTEGER,
  "clicks" INTEGER,
  "costs_cpc" FLOAT,
  "costs_conversion" FLOAT
);

INSERT INTO "out_marketing" 
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