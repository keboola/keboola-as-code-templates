-- create base users table
-- get email domain from email
-- identify employees by the domain - CHANGE ACCORDINGLY!!!
CREATE TABLE "out_user"
AS
    SELECT
        "id"                                                            AS "user_id",
        "name"                                                          AS "user",
        "email",
        split_part("email", '@', 2)                                     AS "email_domain",
        iff("email_domain" LIKE '%keboola.com', 'employee', 'external') AS "user_type"
    FROM "users_details";

INSERT INTO "out_user"
    ("user_id", "user")
VALUES
    ('0', 'Unknown');

-- creating output table with projects
-- date to simple format
-- add workspace name to the projects
-- change boolean values to true/false
CREATE TABLE "out_project"
AS
    SELECT
        "p"."id"                                           AS "project_id",
        "p"."name"                                         AS "project",
        replace(left("pd"."created_at", 19), 'T', ' ')     AS "created_at",
        "pd"."due_date"                                    AS "due_date",
        "w"."name"                                         AS "workspace",
        'https://app.asana.com/0/' || "p"."id" || '/board' AS "url",
        ifnull("u"."user", 'Unknown')                      AS "owner",
        "u"."user_type"                                    AS "owner_type",
        "pd"."current_status_color"                        AS "status",
        iff(length("pd"."current_status_text") > 1024, left("pd"."current_status_text", 1021) || '...',
            "pd"."current_status_text")                    AS "status_text",
        iff("pd"."archived" = '1', 'true', 'false')        AS "archived",
        iff("pd"."public" = '1', 'true', 'false')          AS "public"
    FROM "projects" "p"
             LEFT JOIN "workspaces" "w"
                       ON "p"."parent_id" = "w"."id"
             LEFT JOIN "projects_details" "pd"
                       ON "p"."id" = "pd"."id"
             LEFT JOIN "out_user" "u"
                       ON "pd"."owner_id" = "u"."user_id";

-- create N:M relation table describing user membership in projects
CREATE TABLE "out_project_user"
AS
    SELECT
        ifnull("u"."user_id", '0') AS "user_id",
        "op"."project_id"
    FROM "projects_members" "pm"
             INNER JOIN "out_project" "op"
                        ON "pm"."projects_details_pk" = "op"."project_id"
             LEFT JOIN "out_user" "u"
                       ON "pm"."id" = "u"."user_id";

-- snapshot project table to be able to track progress in time
-- this table is an auxiliary table which will be used for creating final snapshot table later on
-- set timezone to UTC (change accordingly)
ALTER SESSION
    SET TIMEZONE = 'UTC';

CREATE TABLE "out_project_snapshot"
AS
    SELECT
        current_date :: STRING AS "snapshot_date",
        "op".*
    FROM "out_project" "op";
