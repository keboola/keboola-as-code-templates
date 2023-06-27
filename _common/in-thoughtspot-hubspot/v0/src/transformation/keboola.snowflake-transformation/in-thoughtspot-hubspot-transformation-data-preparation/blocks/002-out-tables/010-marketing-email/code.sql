CREATE TABLE "MARKETING_EMAIL"
(
"EMAIL_URL" VARCHAR(2000),
"DATE_CREATED" TIMESTAMP,
"EMAIL_FROM_NAME" VARCHAR(255), 
"CAMPAIGN_NAME" VARCHAR(255), 
"REPLY_TO_EMAIL" VARCHAR(255),
"BOUNCE" INTEGER,
"CLICK" INTEGER, 
"CONTACTS_LOST" INTEGER,
"DELIVERED" INTEGER,
"OPEN" INTEGER
"REPLY" INTEGER, 
"SENT" INTEGER,  
"UNSUBSCRIBED" INTEGER, 
"BOUNCE_RATIO" FLOAT,
"CLICK_RATIO" FLOAT, 
"CLICK_THROUGH_RATIO" FLOAT,
"OPEN_RATIO" FLOAT,
"EMAIL_SUBJECT" VARCHAR(2000),
"CAMPAIGN_ID" VARCHAR(255),
"DATE_CAMPAIGN_SENT" TIMESTAMP,
"CAMPAIGN_DATE" DATE,
"CAMPAIGN_TIME" TIME
);

INSERT INTO "MARKETING_EMAIL"
SELECT t.*,s."DATE_CAMPAIGN_SENT",TO_DATE(s."DATE_CAMPAIGN_SENT") AS "CAMPAIGN_DATE", 
TO_TIME(s."DATE_CAMPAIGN_SENT") AS "CAMPAIGN_TIME"
FROM "MARKETING_EMAIL_TEMP" t LEFT JOIN "MARKETING_CAMPAIGN_SENT_DATE" s 
ON t."CAMPAIGN_ID"=s."CAMPAIGN_ID";
