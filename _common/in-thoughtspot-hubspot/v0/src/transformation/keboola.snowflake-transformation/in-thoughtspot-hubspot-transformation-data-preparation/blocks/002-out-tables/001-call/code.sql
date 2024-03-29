CREATE TABLE "CALL"
(
    "BODY" VARCHAR(2000),
    "TITLE" VARCHAR(2000),
    "CREATED_AT" TIMESTAMP,
    "CREATED_BY" VARCHAR(255),
    "UID" VARCHAR(255),
    "CONTACT_ID" VARCHAR(2000),
    "CALL_OUTCOME" VARCHAR(255),
    "PRE_CUSTOMER_CALL" NUMERIC,
    "CREATED_AT_DATE" DATE,
    "CREATED_AT_TIME" TIME
);


INSERT INTO "CALL"
SELECT C."BODY", C."TITLE",  
DATEADD('MS',E."CREATED_AT",'1970-01-01') AS "CREATED_AT" ,E."CREATED_BY", 
E."ID" AS "UID",  CE."CONTACT_ID",  D."LABEL" AS "CALL_OUTCOME", 
IFF(CON."TOTAL_REVENUE" >0 AND CON."FIRST_DEAL_CREATED_DATE">DATEADD('MS',E."CREATED_AT",'1970-01-01'),1,0)  AS "PRE_CUSTOMER_CALL",
TO_DATE(DATEADD('MS',E."CREATED_AT",'1970-01-01')) AS "CREATED_AT_DATE",
TO_TIME(DATEADD('MS',E."CREATED_AT",'1970-01-01')) AS "CREATED_AT_TIME"
FROM "HS_ENGAGEMENT_CALL" C 
LEFT JOIN "HS_ENGAGEMENTS" E
ON C."ENGAGEMENT_ID"=E."ID"
LEFT JOIN "HS_CONTACT_ENGAGEMENT_ASSOCIATION" CE
ON CE."ENGAGEMENT_ID"=E."ID" 
LEFT JOIN "HS_CALL_DISPOSITIONS" D
ON C."DISPOSITION"=D."ID"
LEFT JOIN "HS_CONTACTS" CON ON 
CON."ID"=CE."CONTACT_ID";
