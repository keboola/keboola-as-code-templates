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

