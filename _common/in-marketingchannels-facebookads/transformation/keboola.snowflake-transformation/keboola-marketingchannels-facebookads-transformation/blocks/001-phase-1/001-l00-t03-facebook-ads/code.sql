-- parse "url_tags" field function
-- PARSE_UTM ( tag you need to parse, "url_tags" field)
CREATE OR REPLACE FUNCTION PARSE_UTM(utm STRING,trg_str STRING ) 
 RETURNS varchar(255) AS '
	case when position(utm in trg_str) >0 then 
    case when position(''&'' in substring(trg_str,position(utm in trg_str)))>0 then 
            left(substring(trg_str,position(utm in trg_str)+length(utm)+1),position(''&'' in substring(trg_str,position(utm in trg_str)+length(utm)+1))-1)
         else 
            substring(trg_str,position(utm in trg_str)+length(utm)+1)
         end             
 else null end
';

-- parse "url_tags" field function

/* utms aren't available
create view "tmp_utm" as 
select distinct "parent_id"
,PARSE_UTM('utm_source',"url_tags") as "source"
,PARSE_UTM('utm_medium',"url_tags") as "medium"
,PARSE_UTM('utm_campaign',"url_tags") as "campaign"
--,PARSE_UTM('utm_content',"url_tags") as "content"
from "Facebook_Ads_ads_insights_adcreatives";*/

CREATE VIEW "tmp_utm" AS 
SELECT DISTINCT 
  "parent_id"
  ,'' as "source"
  ,'' as "medium"
  ,'' as "campaign"
FROM "Facebook_Ads_ads_insights_adcreatives";

-- join all source tables in one
-- create UTM tags (see also query and function above)
CREATE VIEW "tmp_facebook" AS 
SELECT 
	lower("acc"."account_id") AS "account_id"
  ,lower("acc"."currency") AS "currency"
  ,"i"."date_start" AS "date"
  ,lower(ifnull("utm"."source",'facebook')) AS "source"
  ,lower(ifnull("utm"."medium",'cpc')) AS "medium"
  ,lower(CASE WHEN "utm"."campaign"='{{campaign.name}}' THEN "cmp"."name"
     					WHEN "utm"."campaign"='{{adset.name}}' THEN "as"."name"
    					ELSE ifnull("utm"."campaign","cmp"."name")  
         END) AS "campaign"
  ,''AS "domain"
  ,"i"."impressions"
  ,round(IFF("i"."inline_link_clicks"='',0,"i"."inline_link_clicks")) AS "clicks"
  ,to_number("i"."spend",35,4) AS "costs"
FROM "Facebook_Ads_ads_insights" "i"
  LEFT JOIN "Facebook_Ads_ads" AS "a" 
  	ON "i"."ad_id"="a"."id"
  LEFT JOIN "Facebook_Ads_adsets" AS "as" 
  	ON "a"."adset_id"="as"."id"
  LEFT JOIN "tmp_utm" "utm" 
  	ON  "a"."id"="utm"."parent_id"
  LEFT JOIN "Facebook_Ads_campaigns" AS "cmp" 
  	ON "as"."campaign_id"="cmp"."id"
  LEFT JOIN "Facebook_Ads_accounts" AS "acc" 
  	ON "cmp"."ex_account_id"="acc"."id";

-- final output table
CREATE TABLE "out_facebook" AS 
SELECT 
	ifnull("date",'') || '*' || ifnull("source",'') || '*' || ifnull("medium",'') || '*' || ifnull("campaign",'') || '*' || ifnull("domain",'') || '*' || ifnull("currency",'') || '*' || ifnull("account_id",'')  AS "facebook_ads_id"
  ,SUM("clicks") AS "clicks"
  ,SUM("impressions") AS "impressions"
  ,SUM("costs") AS "costs"
FROM "tmp_facebook"
GROUP BY "date","domain","source","medium","campaign","account_id","currency";
