-- HS_HUBSPOT."PUBLIC".HS_MARKETING_EMAILS
CREATE OR REPLACE TABLE HS_MARKETING_EMAILS AS
SELECT DISTINCT
"absoluteUrl" AS "EMAIL_URL",
DATEADD('MS',to_varchar("created"),'1970-01-01')  AS "DATE_CREATED",
"fromName" AS "EMAIL_FROM_NAME", 
"name" AS "CAMPAIGN_NAME", 
"replyTo" AS "REPLY_TO_EMAIL",
"stats__counters__bounce" AS "BOUNCE", 
"stats__counters__click" AS "CLICK", 
"stats__counters__contactslost" AS "CONTACTS_LOST",
"stats__counters__delivered" AS "DELIVERED", 
"stats__counters__open" AS "OPEN",
"stats__counters__reply" AS "REPLY", 
"stats__counters__sent" AS "SENT",  
"stats__counters__unsubscribed" AS "UNSUBSCRIBED", 
"stats__ratios__bounceratio" AS "BOUNCE_RATIO",
"stats__ratios__clickratio" AS "CLICK_RATIO", 
"stats__ratios__clickthroughratio" AS "CLICK_THROUGH_RATIO",
"stats__ratios__openratio" AS "OPEN_RATIO",
"subject" AS "EMAIL_SUBJECT", 
replace(F.value,'""','') AS "CAMPAIGN_ID"
FROM "marketing_email_statistics", 
Table(Flatten(strtok_to_array(replace(replace("marketing_email_statistics"."allEmailCampaignIds",'[',''),']',''),', '))) F;

/*
CREATE OR REPLACE TABLE HEVO_MARKETING_EMAILS_API AS
SELECT 
"id" AS "campaign_id",
"name" AS "campaign_name",
"subject" AS "campaign_subject",
"type" AS "campaign_type",
"appName" AS "app_name",
sum(case when "counters_processed" = 'nan' then 0 else "counters_processed" end) AS "total_proceseed",
sum(case when "counters_sent" = 'nan' then 0 else "counters_sent" end) AS "total_sent",
sum(case when "counters_delivered" = 'nan' then 0 else "counters_delivered" end) AS "total_delivered",
sum(case when "counters_open" = 'nan' then 0 else "counters_open" end) AS "total_opened",
sum(case when "counters_click" = 'nan' then 0 else "counters_click" end) AS "total_clicked"
FROM "campaigns"
GROUP BY "id","name","subject","type","appName";
*/
