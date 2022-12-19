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
       CONVERT_TELEMETRY_TIMESTAMP("kbc_project_created") AS "project_created",
       CONVERT_TELEMETRY_TIMESTAMP("kbc_project_deleted") AS "project_deleted",
       "kbc_project_is_deleted"                              AS "project_is_deleted",
       NOT "kbc_project_is_deleted"                          AS "project_is_active",
       "kbc_project_type"                                    AS "project_type",
       "kbc_project_url"                                     AS "project_url",
       cm.*
FROM "kbc_project" p
     LEFT JOIN "cm_projects" cm ON cm."kbc_project_id" = p."kbc_project_id";

ALTER TABLE "out_projects"
	DROP COLUMN "kbc_project_id";