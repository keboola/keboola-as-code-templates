--account table
CREATE TABLE "companies_tmp"
AS
    SELECT
        OBJECT_CONSTRUCT(*) AS "obj"
    FROM "companies";

CREATE TABLE "out_companies"
(
"companyId" VARCHAR(1024) NOT NULL,
"name" VARCHAR(255),
"website" VARCHAR(255),
"createdate" DATE,
"isDeleted" BOOLEAN
);

INSERT INTO "out_companies"
    SELECT
        trim("obj":"companyId", '"')            AS "companyId",
        trim("obj":"name", '"')                 AS "name",
        trim("obj":"website", '"')              AS "website",
        nullif(trim(to_date("obj":"createdate"), '"'),'') AS "createdate",
        trim("obj":"isDeleted", '"')             AS "isDeleted"
    FROM "companies_tmp";

--contacts table
CREATE TABLE "contacts_tmp"
AS
    SELECT
        OBJECT_CONSTRUCT(*) AS "obj"
    FROM "contacts";

CREATE TABLE "out_contacts"
(
    "canonical_vid" VARCHAR(1024) NOT NULL,
    "firstname" VARCHAR(255),
    "lastname" VARCHAR(255),
    "email" VARCHAR(255),
    "createdate" DATE,
    "email_source" VARCHAR(255),
    "associatedcompanyid" VARCHAR(255),
    "lifecyclestage" VARCHAR(255)
);

INSERT INTO "out_contacts"
    SELECT
        trim("obj":"canonical_vid", '"')       AS "canonical_vid",
        trim("obj":"firstname", '"')           AS "firstname",
        trim("obj":"lastname", '"')            AS "lastname",
        trim("obj":"email", '"')               AS "email",
        nullif(trim(to_date("obj":"createdate"), '"'),'')          AS "createdate",
        trim("obj":"email_source", '"')        AS "email_source",
        trim("obj":"associatedcompanyid", '"') AS "associatedcompanyid",
        trim("obj":"lifecyclestage", '"')      AS "lifecyclestage"
    FROM "contacts_tmp";

--owners table
CREATE TABLE "owners_tmp"
AS
    SELECT
        OBJECT_CONSTRUCT(*) AS "obj"
    FROM "owners";

CREATE TABLE "out_owners"
(
"ownerId" VARCHAR(1024) NOT NULL,
"firstName" VARCHAR(255),
"lastName" VARCHAR(255),
"email" VARCHAR(255)
);

INSERT INTO "out_owners"
    SELECT
        trim("obj":"ownerId", '"')   AS "ownerId",
        trim("obj":"firstName", '"') AS "firstName",
        trim("obj":"lastName", '"')  AS "lastName",
        trim("obj":"email", '"')     AS "email"
    FROM "owners_tmp";

--deals table
CREATE TABLE "deals_tmp"
AS
    SELECT
        OBJECT_CONSTRUCT(*) AS "obj"
    FROM "deals";

CREATE TABLE "out_deals"
(
    "dealId" VARCHAR(1024) NOT NULL,
    "isDeleted" BOOLEAN,
    "dealname" VARCHAR(255),
    "createdate" DATE,
    "closedate" DATE,
    "dealtype" VARCHAR(255),
    "amount" FLOAT,
    "pipeline" VARCHAR(255),
    "dealstage" VARCHAR(255),
    "hubspot_owner_id" VARCHAR(255),
    "hs_analytics_source" VARCHAR(255)
);

INSERT INTO "out_deals"
    SELECT
        trim("obj":"dealId", '"')                           AS "dealId",
        trim("obj":"isDeleted", '"')                        AS "isDeleted",
        trim("obj":"dealname", '"')                         AS "dealname",
        nullif(trim("obj":"createdate", '"'),'')   					AS "createdate",
        nullif(trim("obj":"closedate", '"'),'')    					AS "closedate",
        trim("obj":"dealtype", '"')                         AS "dealtype",
        nullif(trim("obj":"amount", '"'),'')                AS "amount",
        trim("obj":"pipeline", '"')                         AS "pipeline",
        trim("obj":"dealstage", '"')                        AS "dealstage",
        trim("obj":"hubspot_owner_id", '"')                 AS "hubspot_owner_id",
        trim("obj":"hs_analytics_source", '"')              AS "hs_analytics_source"
    FROM "deals_tmp";

--deals companies table
CREATE TABLE "deals_companies_tmp"
AS
    SELECT
        OBJECT_CONSTRUCT(*) AS "obj"
    FROM "deals_assoc_companies_list";

CREATE TABLE "out_deals_companies"
(
    "dealId" VARCHAR(1024) NOT NULL,
    "associated_companyId" VARCHAR(255) NOT NULL
);

INSERT INTO "out_deals_companies"
    SELECT
        trim("obj":"dealId", '"')               AS "dealId",
        trim("obj":"associated_companyId", '"') AS "associated_companyId"
    FROM "deals_companies_tmp";

--pipelines table
CREATE TABLE "pipelines_tmp"
AS
    SELECT
        OBJECT_CONSTRUCT(*) AS "obj"
    FROM "pipelines";

CREATE TABLE "out_pipelines"
(
    "pipelineId" VARCHAR(1024) NOT NULL,
    "label" VARCHAR(255)
);

INSERT INTO "out_pipelines"
    SELECT
        trim("obj":"pipelineId", '"') AS "pipelineId",
        trim("obj":"label", '"')      AS "label"
    FROM "pipelines_tmp";

--stages table
CREATE TABLE "stages_tmp"
AS
    SELECT
        OBJECT_CONSTRUCT(*) AS "obj"
    FROM "pipeline_stages";

CREATE TABLE "out_stages"
(
    "stageId" VARCHAR(1024) NOT NULL,
    "label" VARCHAR(255),
    "displayOrder" INTEGER,
    "probability" FLOAT,
    "closedWon" BOOLEAN
);

INSERT INTO "out_stages"
    SELECT
        trim("obj":"stageId", '"') 		AS "stageId",
        trim("obj":"label", '"')   		AS "label",
        nullif(trim("obj":"displayOrder", '"'),'') AS "displayOrder",
        nullif(trim("obj":"probability", '"'),'')	AS "probability",
        trim("obj":"closedWon", '"')	AS "closedWon"
    FROM "stages_tmp";

--deals_contacts_list table
CREATE TABLE "deals_contacts_list_tmp"
AS
    SELECT
        OBJECT_CONSTRUCT(*) AS "obj"
    FROM "deals_contacts_list";

CREATE TABLE "out_deals_contacts_list"
(
    "contact_vid" VARCHAR(1024) NOT NULL,
    "dealId" VARCHAR(1024) NOT NULL
);

INSERT INTO "out_deals_contacts_list"
    SELECT
        trim("obj":"contact_vid", '"') AS "contact_vid",
        trim("obj":"dealId", '"')      AS "dealId"
    FROM "deals_contacts_list_tmp";

--activities table
CREATE TABLE "activities_tmp"
AS
    SELECT
        OBJECT_CONSTRUCT(*) AS "obj"
    FROM "activities";

CREATE TABLE "out_activities"
(
    "engagement_id" VARCHAR(1024) NOT NULL,
    "metadata_subject" VARCHAR(2000),
    "engagement_createdAt" DATE,
    "metadata_durationMilliseconds" VARCHAR(255),
    "associations_contactIds" VARCHAR(255),
    "associations_dealIds" VARCHAR(255),
    "associations_ownerIds" VARCHAR(255)
);

INSERT INTO "out_activities"
    SELECT
        trim("obj":"engagement_id", '"')                 AS "engagement_id",
        trim("obj":"metadata_subject", '"')              AS "metadata_subject",
        nullif(trim("obj":"engagement_createdAt", '"'),'')          AS "engagement_createdAt",
        trim("obj":"metadata_durationMilliseconds", '"') AS "metadata_durationMilliseconds",
        trim("obj":"associations_contactIds", '"')       AS "associations_contactIds",
        trim("obj":"associations_dealIds", '"')          AS "associations_dealIds",
        trim("obj":"associations_ownerIds", '"')         AS "associations_ownerIds"
    FROM "activities_tmp";