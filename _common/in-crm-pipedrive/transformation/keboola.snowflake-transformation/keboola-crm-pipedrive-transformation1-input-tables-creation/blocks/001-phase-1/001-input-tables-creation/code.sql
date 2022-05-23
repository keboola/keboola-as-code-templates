--activities table
CREATE TABLE "activities_tmp"
AS
    SELECT
        OBJECT_CONSTRUCT(*) AS "obj"
    FROM "activities";

CREATE TABLE "out_activities"
AS
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
AS
    SELECT
        trim("obj":"deal_id", '"')              AS "deal_id",
        trim("obj":"deal_deleted", '"')         AS "deal_deleted",
        trim("obj":"lost_time", '"')            AS "lost_time",
        trim("obj":"add_time", '"')             AS "add_time",
        trim("obj":"deal_currency", '"')        AS "deal_currency",
        trim("obj":"deal_value", '"')           AS "deal_value",
        trim("obj":"deal_status", '"')          AS "deal_status",
        trim("obj":"close_time", '"')           AS "close_time",
        trim("obj":"products_count", '"')       AS "products_count",
        trim("obj":"person_id", '"')   		    AS "person_id",
        trim("obj":"stage_order_nr", '"')       AS "stage_order_nr",
        trim("obj":"won_time", '"')             AS "won_time",
        trim("obj":"deal_title", '"')           AS "deal_title",
        trim("obj":"pipeline_id", '"')          AS "pipeline_id",
        trim("obj":"org_id", '"')               AS "org_id",
        trim("obj":"owner_id", '"')             AS "owner_id",
        trim("obj":"deal_active", '"')          AS "deal_active",
        trim("obj":"expected_close_date", '"')  AS "expected_close_date",
        trim("obj":"stage_id", '"')             AS "stage_id",
        trim("obj":"activities_count", '"')     AS "activities_count",
        trim("obj":"email_messages_count", '"') AS "email_messages_count",
        trim("obj":"lost_reason", '"')          AS "lost_reason"
    FROM "deals_tmp";

--organizations table
CREATE TABLE "organizations_tmp"
AS
    SELECT
        OBJECT_CONSTRUCT(*) AS "obj"
    FROM "organizations";

CREATE TABLE "out_organizations"
AS
    SELECT
        trim("obj":"organization_id", '"')         AS "organization_id",
        trim("obj":"org_name", '"')                AS "org_name",
        trim("obj":"owner_id", '"')                AS "owner_id",
        trim("obj":"org_address", '"')             AS "org_address",
        trim("obj":"fk_category_id", '"')          AS "fk_category_id",
        trim("obj":"org_address_country", '"')     AS "org_address_country",
        trim("obj":"org_address_postal_code", '"') AS "org_address_postal_code",
        trim("obj":"org_add_date", '"')            AS "org_add_date"
    FROM "organizations_tmp";

--persons table
CREATE TABLE "persons_tmp"
AS
    SELECT
        OBJECT_CONSTRUCT(*) AS "obj"
    FROM "persons";

CREATE TABLE "out_persons"
AS
    SELECT
        trim("obj":"contact_id", '"')   AS "contact_id",
        trim("obj":"contact_name", '"') AS "contact_name",
        trim("obj":"org_id", '"')       AS "org_id",
        trim("obj":"add_time", '"')     AS "add_time"
    FROM "persons_tmp";

--person emails table
CREATE TABLE "person_emails_tmp"
AS
    SELECT
        OBJECT_CONSTRUCT(*) AS "obj"
    FROM "person_emails";

CREATE TABLE "out_person_emails"
AS
    SELECT
        trim("obj":"persons_pk", '"') AS "contact_id",
        trim("obj":"label", '"')      AS "label",
        trim("obj":"value", '"')      AS "value",
        trim("obj":"primary", '"')    AS "primary"
    FROM "person_emails_tmp";

--pipelines table
CREATE TABLE "pipelines_tmp"
AS
    SELECT
        OBJECT_CONSTRUCT(*) AS "obj"
    FROM "pipelines";

CREATE TABLE "out_pipelines"
AS
    SELECT
        trim("obj":"pipeline_id", '"')   AS "pipeline_id",
        trim("obj":"pipeline_name", '"') AS "pipeline_name",
        trim("obj":"url_title", '"')     AS "url_title",
        trim("obj":"order_nr", '"')      AS "order_nr",
        trim("obj":"active", '"')        AS "active"
    FROM "pipelines_tmp";

--stages table
CREATE TABLE "stages_tmp"
AS
    SELECT
        OBJECT_CONSTRUCT(*) AS "obj"
    FROM "stages";

CREATE TABLE "out_stages"
AS
    SELECT
        trim("obj":"stage_id", '"')         AS "stage_id",
        trim("obj":"order_nr", '"')         AS "order_nr",
        trim("obj":"stage_name", '"')       AS "stage_name",
        trim("obj":"active_flag", '"')      AS "active_flag",
        trim("obj":"pipeline_id", '"')      AS "pipeline_id",
        trim("obj":"deal_probability", '"') AS "deal_probability",
        trim("obj":"add_time", '"')         AS "add_time"
    FROM "stages_tmp";

--users table
CREATE TABLE "users_tmp"
AS
    SELECT
        OBJECT_CONSTRUCT(*) AS "obj"
    FROM "users";

CREATE TABLE "out_users"
AS
    SELECT
        trim("obj":"owner_id", '"')    AS "owner_id",
        trim("obj":"owner_name", '"')  AS "owner_name",
        trim("obj":"owner_email", '"') AS "owner_email"
    FROM "users_tmp";
