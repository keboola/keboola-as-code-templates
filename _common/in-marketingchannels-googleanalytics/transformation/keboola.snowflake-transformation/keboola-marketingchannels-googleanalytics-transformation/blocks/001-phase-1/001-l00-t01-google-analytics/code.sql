-- NOT collected session_id and client_id
CREATE OR REPLACE VIEW "out_ga_traffic" AS
SELECT  
	ifnull("date",'') || '*' || ifnull("source",'') || '*' || ifnull("medium",'') || '*' || ifnull("campaign",'') || '*' || ifnull("domain",'')  || '*' || ifnull("account_id",'') || '*' || ifnull("keyword",'') || '*' || ifnull("ad_group",'') AS "ga_traffic_id"
  ,SUM("sessions_new") AS "sessions_new"
  ,SUM("sessions_return") AS "sessions_return"
  ,SUM("pageviews") AS "pageviews"
  ,SUM("bounces") AS "bounces"
FROM (
	SELECT 
  	"date"
    ,lower(iff( "source"='(not set)','',"source")) AS "source"
    ,lower(iff("medium"='(not set)','',"medium")) AS "medium"
    ,lower(iff("campaign"='(not set)','',"campaign")) AS "campaign"
    ,lower(substring("hostname",LENGTH("hostname")-POSITION('.' IN reverse("hostname"))+2)) AS "domain"
    ,lower("idProfile") AS "account_id"
    ,lower("keyword") AS "keyword"
    ,lower("adGroup") AS "ad_group"
    ,CASE WHEN "userType"='New Visitor' THEN to_number("sessions",35) ELSE 0 END AS "sessions_new"
    ,CASE WHEN "userType"='Returning Visitor' THEN to_number("sessions",35) ELSE 0 END AS "sessions_return"
    ,"pageviews"
    ,"bounces"
	FROM "ga-basic-sessions"
		) 
WHERE ("sessions_new" + "sessions_return" + "pageviews" + "bounces") > 0
GROUP BY "date"
,"source"
,"medium"
,"campaign"
,"domain"
,"account_id"
,"keyword"
,"ad_group";

-- transaction detail
CREATE OR REPLACE VIEW "out_ga_transactions" AS
SELECT  
	ifnull("date",'') || '*' || ifnull("source",'') || '*' || ifnull("medium",'') || '*' || ifnull("campaign",'') || '*' || 			ifnull("domain",'')  || '*' ||
ifnull("account_id",'') || '*' || ifnull("keyword",'') || '*' || ifnull("ad_group",'')|| '*' || ifnull("transaction_id",'')   AS 	"ga_transactions_id"
	,SUM("item_quantity") AS "item_quantity"
FROM (
	SELECT 
  	"date"
    ,lower(iff( "source"='(not set)','',"source")) AS "source"
    ,lower(iff("medium"='(not set)','',"medium")) AS "medium"
    ,lower(iff("campaign"='(not set)','',"campaign")) AS "campaign"
    ,lower(substring("hostname",LENGTH("hostname")-POSITION('.' IN reverse("hostname"))+2)) AS "domain"
    ,lower("idProfile") AS "account_id"
    ,lower("keyword") AS "keyword"
    ,lower("adGroup") AS "ad_group"
    ,lower("transactionId") AS "transaction_id"
    ,"itemQuantity" AS "item_quantity" 
	FROM "ga-basic-transactions"
		) 
WHERE "item_quantity">0 
GROUP BY "date"
  ,"source"
  ,"medium"
  ,"campaign"
  ,"domain"
  ,"account_id"
  ,"keyword"
  ,"ad_group"
  ,"transaction_id";
