--activities table
CREATE TABLE "activities_tmp"
AS
    SELECT
        OBJECT_CONSTRUCT(*) AS "obj"
    FROM "activities";

CREATE TABLE "out_activities"
(
  "activity_id" VARCHAR(1024) NOT NULL,
	"company_id" VARCHAR(1024),
  "user_id" VARCHAR(1024),
  "person_id" VARCHAR(1024),
  "type" VARCHAR(255),
  "deal_id" VARCHAR(1024),
  "subject" VARCHAR(1024),
	"due_date" DATE,
	"add_time" TIMESTAMP,
  "done" VARCHAR(1024)
);

INSERT INTO "out_activities"
    SELECT
        trim("obj":"activity_id", '"') AS "activity_id",
        trim("obj":"company_id", '"')  AS "company_id",
        trim("obj":"user_id", '"')     AS "user_id",
        trim("obj":"person_id", '"')   AS "person_id",
        trim("obj":"type", '"')        AS "type",
        trim("obj":"deal_id", '"')     AS "deal_id",
        trim("obj":"subject", '"')     AS "subject",
        trim("obj":"due_date", '"')    AS "due_date",
        trim("obj":"add_time", '"')    AS "add_time",
        trim("obj":"done", '"')        AS "done"
    FROM "activities_tmp";

--deals table
CREATE TABLE "deals_tmp"
AS
    SELECT
        OBJECT_CONSTRUCT(*) AS "obj"
    FROM "deals";

CREATE TABLE "out_deals"
(
  "deal_id" VARCHAR(1024) NOT NULL,
  "deal_deleted" INTEGER,
  "lost_time" TIMESTAMP,
  "add_time" TIMESTAMP,
  "deal_currency" VARCHAR(255),
  "deal_value"  VARCHAR(255),
  "deal_status"  VARCHAR(1024),
  "close_time" TIMESTAMP,
  "products_count" INTEGER,
  "person_id" VARCHAR(255),
  "stage_order_nr" INTEGER,
  "won_time" TIMESTAMP,
  "deal_title" VARCHAR(1024),
  "pipeline_id" VARCHAR(1024),
  "org_id" VARCHAR(1024),
  "owner_id" VARCHAR(1024),
  "deal_active" INTEGER,
  "expected_close_date" DATE,
  "stage_id" VARCHAR(1024),
  "activities_count" INTEGER,
  "email_messages_count" INTEGER,
  "lost_reason" VARCHAR(1024)
);

INSERT INTO "out_deals"
    SELECT
        trim("obj":"deal_id", '"')              					AS "deal_id",
        nullif(trim("obj":"deal_deleted", '"'),'')        AS "deal_deleted",
        nullif(trim("obj":"lost_time", '"'),'')           AS "lost_time",
        nullif(trim("obj":"add_time", '"'),'')            AS "add_time",
        trim("obj":"deal_currency", '"')        					AS "deal_currency",
        trim("obj":"deal_value", '"')           					AS "deal_value",
        trim("obj":"deal_status", '"')          					AS "deal_status",
        nullif(trim("obj":"close_time", '"'),'')          AS "close_time",
        nullif(trim("obj":"products_count", '"'),'')      AS "products_count",
        trim("obj":"person_id", '"')   		    						AS "person_id",
        nullif(trim("obj":"stage_order_nr", '"'),'')      AS "stage_order_nr",
        nullif(trim("obj":"won_time", '"'),'')            AS "won_time",
        trim("obj":"deal_title", '"')           					AS "deal_title",
        trim("obj":"pipeline_id", '"')         					 	AS "pipeline_id",
        trim("obj":"org_id", '"')               					AS "org_id",
        trim("obj":"owner_id", '"')             					AS "owner_id",
        nullif(trim("obj":"deal_active", '"'),'')         AS "deal_active",
        nullif(trim("obj":"expected_close_date", '"'), '')  					AS "expected_close_date",
        trim("obj":"stage_id", '"')             					AS "stage_id",
        nullif(trim("obj":"activities_count", '"'),'')    AS "activities_count",
        nullif(trim("obj":"email_messages_count", '"'),'') AS "email_messages_count",
        trim("obj":"lost_reason", '"')          					AS "lost_reason"
    FROM "deals_tmp";

--organizations table
CREATE TABLE "organizations_tmp"
AS
    SELECT
        OBJECT_CONSTRUCT(*) AS "obj"
    FROM "organizations";

CREATE TABLE "out_organizations"
(
  "organization_id" VARCHAR(1024) NOT NULL,
  "org_name" VARCHAR(1024),
  "owner_id" VARCHAR(1024),
  "org_address" VARCHAR(1024),
  "fk_category_id" VARCHAR(1024),
  "org_address_country" VARCHAR(255),
  "org_address_postal_code" VARCHAR(255),
  "org_add_date" DATE
);

INSERT INTO "out_organizations"
    SELECT
        trim("obj":"organization_id", '"')         AS "organization_id",
        trim("obj":"org_name", '"')                AS "org_name",
        trim("obj":"owner_id", '"')                AS "owner_id",
        trim("obj":"org_address", '"')             AS "org_address",
        trim("obj":"fk_category_id", '"')          AS "fk_category_id",
        trim("obj":"org_address_country", '"')     AS "org_address_country",
        trim("obj":"org_address_postal_code", '"') AS "org_address_postal_code",
        nullif(trim("obj":"org_add_date", '"'),'') AS "org_add_date"
    FROM "organizations_tmp";

--persons table
CREATE TABLE "persons_tmp"
AS
    SELECT
        OBJECT_CONSTRUCT(*) AS "obj"
    FROM "persons";

CREATE TABLE "out_persons"
(
"contact_id" VARCHAR(255) NOT NULL,
"contact_name" VARCHAR(255),
"org_id" VARCHAR(255),
"add_time" TIMESTAMP
);

INSERT INTO "out_persons"
    SELECT
        trim("obj":"contact_id", '"')   					AS "contact_id",
        trim("obj":"contact_name", '"') 					AS "contact_name",
        trim("obj":"org_id", '"')       					AS "org_id",
        nullif(trim("obj":"add_time", '"'),'')    AS "add_time"
    FROM "persons_tmp";

--person emails table
CREATE TABLE "person_emails_tmp"
AS
    SELECT
        OBJECT_CONSTRUCT(*) AS "obj"
    FROM "person_emails";

CREATE TABLE "out_person_emails"
(
"contact_id" VARCHAR(255) NOT NULL,
"label" VARCHAR(255) NOT NULL,
"value" VARCHAR(255),
"primary" INTEGER
);

INSERT INTO "out_person_emails"
    SELECT
        trim("obj":"contact_id", '"') 					AS "contact_id",
        trim("obj":"label", '"')      					AS "label",
        trim("obj":"value", '"')      					AS "value",
        nullif(trim("obj":"primary", '"'),'')   AS "primary"
    FROM "person_emails_tmp";

--pipelines table
CREATE TABLE "pipelines_tmp"
AS
    SELECT
        OBJECT_CONSTRUCT(*) AS "obj"
    FROM "pipelines";

CREATE TABLE "out_pipelines"
(
   "pipeline_id" VARCHAR(1024) NOT NULL,
  "pipeline_name" VARCHAR(255),
  "url_title" VARCHAR(255),
  "order_nr" INTEGER,
  "active" INTEGER
);

INSERT INTO "out_pipelines"
    SELECT
        trim("obj":"pipeline_id", '"')   					AS "pipeline_id",
        trim("obj":"pipeline_name", '"') 					AS "pipeline_name",
        trim("obj":"url_title", '"')     					AS "url_title",
        nullif(trim("obj":"order_nr", '"'),'')    AS "order_nr",
        nullif(trim("obj":"active", '"'),'')      AS "active"
    FROM "pipelines_tmp";

--stages table
CREATE TABLE "stages_tmp"
AS
    SELECT
        OBJECT_CONSTRUCT(*) AS "obj"
    FROM "stages";

CREATE TABLE "out_stages"
(
  "stage_id" VARCHAR(1024) NOT NULL,
  "order_nr" INTEGER,
  "stage_name" VARCHAR(1024),
  "active_flag" INTEGER,
  "pipeline_id" VARCHAR(1024),
  "deal_probability" INTEGER,
  "add_time" TIMESTAMP
);

INSERT INTO "out_stages"
    SELECT
        trim("obj":"stage_id", '"')         						AS "stage_id",
        nullif(trim("obj":"order_nr", '"'),'')         	AS "order_nr",
        trim("obj":"stage_name", '"')       						AS "stage_name",
        nullif(trim("obj":"active_flag", '"'),'')      	AS "active_flag",
        trim("obj":"pipeline_id", '"')      						AS "pipeline_id",
        nullif(trim("obj":"deal_probability", '"'),'') 	AS "deal_probability",
        nullif(trim("obj":"add_time", '"'),'')         	AS "add_time"
    FROM "stages_tmp";

--users table
CREATE TABLE "users_tmp"
AS
    SELECT
        OBJECT_CONSTRUCT(*) AS "obj"
    FROM "users";

CREATE TABLE "out_users"
(
	"owner_id" VARCHAR(1024) NOT NULL,
 "owner_name" VARCHAR(255),
 "owner_email" VARCHAR(255)
);

INSERT INTO "out_users"
    SELECT
        trim("obj":"owner_id", '"')    AS "owner_id",
        trim("obj":"owner_name", '"')  AS "owner_name",
        trim("obj":"owner_email", '"') AS "owner_email"
    FROM "users_tmp";