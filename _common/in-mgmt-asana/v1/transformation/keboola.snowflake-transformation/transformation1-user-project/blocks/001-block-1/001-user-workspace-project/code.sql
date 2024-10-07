-- create base users table
-- get email domain from email
-- identify employees by the domain - CHANGE ACCORDINGLY!!!
CREATE TABLE "out_user"
(
    "user_id" VARCHAR(255) NOT NULL,
    "user" VARCHAR(255),
    "email" VARCHAR(255),
    "email_domain" VARCHAR(255),
    "user_type" VARCHAR(255)
);

INSERT INTO "out_user"
    SELECT
        "id"                                                            AS "user_id",
        "name"                                                          AS "user",
        "email",
        split_part("email", '@', 2)                                     AS "email_domain",
        "resource_type"								                    AS "user_type"
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
(
    "project_id" VARCHAR(255) NOT NULL,
    "project" VARCHAR(255),
    "created_at" TIMESTAMP,
    "due_date" VARCHAR(255),
    "workspace" VARCHAR(255),
    "url" VARCHAR(1024),
    "owner" VARCHAR(255),
    "owner_type" VARCHAR(255),
    "status" VARCHAR(255),
    "status_text" VARCHAR(255),
    "archived" VARCHAR(255),
    "public" VARCHAR(255)
);

INSERT INTO "out_project"
    SELECT
        "pd"."id"                                           AS "project_id",
        "pd"."name"                                         AS "project",
        replace(left("pd"."created_at", 19), 'T', ' ')      AS "created_at",
        "pd"."due_date"                                     AS "due_date",
        "w"."name"                                          AS "workspace",
        'https://app.asana.com/0/' || "pd"."id" || '/board' AS "url",
        ifnull("u"."user", 'Unknown')                       AS "owner",
        "u"."user_type"                                			AS "owner_type",
        "pd"."current_status_color"                         AS "status",
        iff(length("pd"."current_status_text") > 1024, left("pd"."current_status_text", 1021) || '...',
            "pd"."current_status_text")                     AS "status_text",
        iff("pd"."archived" = 'True', 'true', 'false')      AS "archived",
        iff("pd"."public" = 'True', 'true', 'false')        AS "public"
    FROM "projects_details" "pd"
             LEFT JOIN "workspaces" "w"
                       ON "pd"."workspace_id" = "w"."id"
             LEFT JOIN "out_user" "u"
                       ON "pd"."owner_id" = "u"."user_id";

-- create N:M relation table describing user membership in projects
CREATE TABLE "out_project_user"
(
    "user_id" VARCHAR(255) NOT NULL,
    "project_id" VARCHAR(255) NOT NULL
);

INSERT INTO "out_project_user"
    SELECT
        ifnull("u"."user_id", '0') AS "user_id",
        "op"."project_id"
    FROM "projects_members" "pm"  
             INNER JOIN "out_project" "op"
                        ON "pm"."project_id" = "op"."project_id"
             LEFT JOIN "out_user" "u"
                       ON "pm"."id" = "u"."user_id";

-- snapshot project table to be able to track progress in time
-- this table is an auxiliary table which will be used for creating final snapshot table later on
-- set timezone to UTC (change accordingly)
ALTER SESSION
    SET TIMEZONE = 'UTC';

CREATE TABLE "out_project_snapshot"
(
    "snapshot_date" DATE NOT NULL,
    "project_id" VARCHAR(255) NOT NULL,
    "project" VARCHAR(255),
    "created_at" TIMESTAMP,
    "due_date" VARCHAR(255),
    "workspace" VARCHAR(255),
    "url" VARCHAR(1024),
    "owner" VARCHAR(255),
    "owner_type" VARCHAR(255),
    "status" VARCHAR(255),
    "status_text" VARCHAR(255),
    "archived" VARCHAR(255),
    "public" VARCHAR(255)
);

INSERT INTO "out_project_snapshot"
    SELECT
        current_date :: STRING AS "snapshot_date",
        "op".*
    FROM "out_project" "op";
