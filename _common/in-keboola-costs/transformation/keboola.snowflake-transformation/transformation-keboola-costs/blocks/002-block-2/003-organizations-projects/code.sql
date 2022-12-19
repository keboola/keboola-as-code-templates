/*
CREATE TABLE IF NOT EXISTS "cm_organizations" AS
SELECT DISTINCT "kbc_organization_id",
                'Default'             AS "organization_mapping"
FROM "kbc_organization";

-- DROP TABLE IF EXISTS "out-organizations";
CREATE TABLE "out_organizations" AS
SELECT o."kbc_organization_id"                                                                AS "organization_id",
       o."kbc_organization"                                                                   AS "organization_name",
       replace(CONVERT_TELEMETRY_TIMESTAMP(o."kbc_organization_created_at"),' Z','')          AS "organization_created",
       APPEND_REGION(SPLIT_PART(o."kbc_organization_id", '-', 1), o."kbc_organization_id", 2) AS "organization_key",
       cm.*
FROM "kbc_organization" o
     LEFT JOIN "cm_organizations" cm ON cm."kbc_organization_id" = o."kbc_organization_id";

ALTER TABLE "out_organizations"
	DROP COLUMN "kbc_organization_id";
*/
CREATE TABLE IF NOT EXISTS "cm_projects" AS
SELECT DISTINCT "kbc_project_id",
                'Default'        AS "project_department",
                'Default'        AS "project_team"
FROM "kbc_project";

--DROP TABLE IF EXISTS "out-projects";
CREATE OR REPLACE TABLE "out_projects" AS
SELECT p."kbc_project_id"                                    AS "project_id",
       SPLIT_PART(p."kbc_project_id", '-', 1)                  AS "project_number",
       "kbc_project"                                         AS "project_name",
       "kbc_organization_id"                                 AS "organization_id",
       replace(CONVERT_TELEMETRY_TIMESTAMP("kbc_project_created"),' Z','') AS "project_created",
       replace(CONVERT_TELEMETRY_TIMESTAMP("kbc_project_deleted"),' Z','') AS "project_deleted",
       "kbc_project_is_deleted"                              AS "project_is_deleted",
       NOT "kbc_project_is_deleted"                          AS "project_is_active",
       "kbc_project_type"                                    AS "project_type",
       "kbc_project_url"                                     AS "project_url",
       cm.*
FROM "kbc_project" p
     LEFT JOIN "cm_projects" cm ON cm."kbc_project_id" = p."kbc_project_id";

ALTER TABLE "out_projects"
	DROP COLUMN "kbc_project_id";