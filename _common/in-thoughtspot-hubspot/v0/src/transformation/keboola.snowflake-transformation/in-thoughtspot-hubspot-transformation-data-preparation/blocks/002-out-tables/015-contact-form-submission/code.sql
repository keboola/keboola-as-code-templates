CREATE TABLE "CONTACT_FORM_SUBMISSION"
(
    "SUBMITTED_AT" TIMESTAMP,
    "FORM_ID" VARCHAR(2000),
    "CONTACT_ID" VARCHAR(2000),
    "PRE_CUSTOMER_FORM" NUMERIC,
    "CREATED_AT_DATE" DATE,
    "CREATED_AT_TIME" TIME
);

INSERT INTO "CONTACT_FORM_SUBMISSION"
SELECT DATEADD('MS',NULLIF(F."SUBMITTED_AT",''),'1970-01-01') AS "SUBMITTED_AT", F."FORM_ID", F."CONTACT_ID",
IFF(NULLIF(CON."TOTAL_REVENUE",'') >0 AND NULLIF(CON."FIRST_DEAL_CREATED_DATE",'')>DATEADD('MS',NULLIF(F."SUBMITTED_AT",''),'1970-01-01'),1,0)  AS "PRE_CUSTOMER_FORM",
TO_DATE(DATEADD('MS',NULLIF(F."SUBMITTED_AT",''),'1970-01-01')) AS "CREATED_AT_DATE",
TO_TIME(DATEADD('MS',NULLIF(F."SUBMITTED_AT",''),'1970-01-01')) AS "CREATED_AT_TIME"
FROM "HS_CONTACT_FORM_SUBMISSION" F
LEFT JOIN "HS_CONTACTS" CON ON 
CON."ID"=F."CONTACT_ID";
