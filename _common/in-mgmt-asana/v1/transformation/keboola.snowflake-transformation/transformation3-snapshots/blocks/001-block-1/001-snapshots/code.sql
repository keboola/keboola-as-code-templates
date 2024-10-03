/*PROJECT SNAPSHOTS*/
--create temporary table for additional calculations
--add previous values of due date, owner and status, so we can define if there has been any change
--don't snapshot already archived projects
CREATE TABLE "project_snapshot_tmp"
AS
    SELECT
        "project_id",
        "snapshot_date",
        nullif("due_date", '')                                                                AS "due_date",
        nullif(lag("due_date") OVER (PARTITION BY "project_id" ORDER BY "snapshot_date"), '') AS "previous_due_date",
        "status",
        row_number() OVER (PARTITION BY "project_id","status" ORDER BY "snapshot_date")       AS "days_in_status",
        ifnull(lag("status") OVER (PARTITION BY "project_id" ORDER BY "snapshot_date"), '')   AS "previous_status",
        "status_text",
        ifnull(lag("status_text") OVER (PARTITION BY "project_id" ORDER BY "snapshot_date"),
               '')                                                                            AS "previous_status_text",
        "owner",
        ifnull(lag("owner") OVER (PARTITION BY "project_id" ORDER BY "snapshot_date"), '')    AS "previous_owner"
    FROM "project_snapshot"
    WHERE "archived" = 'false';

--add partition column to tmp table for assigning number of day in the previous status and other possible calculations
--marking last day of month/quarter last snapshot for reporting
CREATE TABLE "project_snapshot_tmp2"
AS
    SELECT
        "t".*,
        iff("m"."max_date" IS NULL, 'false', 'true')                          AS "last_snapshot",
        iff("lm"."project_id" IS NULL, 'false', 'true')                       AS "last_day_of_month",
        iff("lq"."project_id" IS NULL, 'false', 'true')                       AS "last_day_of_quarter",
        sum(CASE
                WHEN "t"."status" = "t"."previous_status"
                    THEN 0
                ELSE 1
            END)
            OVER (PARTITION BY "t"."project_id" ORDER BY "t"."snapshot_date") AS "continuous_status_partition"
    FROM "project_snapshot_tmp" "t"
             LEFT JOIN (SELECT
                            MAX("snapshot_date") AS "max_date"
                        FROM "project_snapshot_tmp") "m"
                       ON "t"."snapshot_date" = "m"."max_date"
             LEFT JOIN (SELECT
                            "s"."project_id",
                            "s"."snapshot_date"
                        FROM "project_snapshot_tmp" "s"
                                 LEFT JOIN (SELECT
                                                max("snapshot_date") AS "max_date"
                                            FROM "project_snapshot_tmp") "m"
                                           ON "s"."snapshot_date" = "m"."max_date"
                        WHERE "s"."snapshot_date" = last_day("s"."snapshot_date"::DATE)
                           OR "m"."max_date" IS NOT NULL) AS "lm"
                       ON "t"."project_id" = "lm"."project_id"
                           AND "t"."snapshot_date" = "lm"."snapshot_date"
             LEFT JOIN (SELECT
                            "s"."project_id",
                            "s"."snapshot_date"
                        FROM "project_snapshot_tmp" "s"
                                 LEFT JOIN (SELECT
                                                max("snapshot_date") AS "max_date"
                                            FROM "project_snapshot_tmp") "m"
                                           ON "s"."snapshot_date" = "m"."max_date"
                        WHERE "s"."snapshot_date" = last_day("s"."snapshot_date"::DATE, 'quarter')
                           OR "m"."max_date" IS NOT NULL) "lq"
                       ON "t"."project_id" = "lq"."project_id"
                           AND "t"."snapshot_date" = "lq"."snapshot_date";

--create project snapshot table
--define if there has been change of status, owner or due date
--adding number of days in previous stage
--iff project is moved more than once to some status, it always assign number of all days in that previous particular status
CREATE TABLE "out_project_snapshot"
(
    "project_id" VARCHAR(255) NOT NULL,
    "snapshot_date" DATE NOT NULL,
    "status" VARCHAR(255),
    "status_text" VARCHAR(255),
    "days_in_status" INTEGER,
    "previous_status" VARCHAR(255),
    "status_change" BOOLEAN,
    "days_in_previous_status" INTEGER,
    "due_date" VARCHAR(255),
    "previous_due_date" DATE,
    "due_date_change" BOOLEAN,
    "due_date_diff" VARCHAR(255),
    "owner" VARCHAR(255),
    "previous_owner" VARCHAR(255),
    "owner_change" BOOLEAN,
    "last_snapshot" BOOLEAN,
    "last_day_of_month" BOOLEAN,
    "last_day_of_quarter" BOOLEAN
);

INSERT INTO "out_project_snapshot"
    SELECT
        "o"."project_id",
        "o"."snapshot_date",
        "o"."status",
        "o"."status_text",
        "o"."days_in_status",
        "o"."previous_status",
        iff("o"."status" <> "o"."previous_status", 'true', 'false')     AS "status_change",
        "d"."days_in_previous_status",
        "o"."due_date",
        "o"."previous_due_date",
        iff("o"."due_date" <> "o"."previous_due_date", 'true', 'false') AS "due_date_change",
        datediff(DAY, "o"."previous_due_date", "o"."due_date")          AS "due_date_diff",
        "o"."owner",
        "o"."previous_owner",
        iff("o"."owner" <> "o"."previous_owner", 'true', 'false')       AS "owner_change",
        "o"."last_snapshot",
        "o"."last_day_of_month",
        "o"."last_day_of_quarter"
    FROM "project_snapshot_tmp2" "o"
             LEFT JOIN (SELECT
                            "project_id",
                            "continuous_status_partition",
                            "continuous_status_partition" + 1 AS "following_partition",
                            "status",
                            max("days_in_status")             AS "days_in_previous_status"
                        FROM "project_snapshot_tmp2"
                        GROUP BY 1, 2, 3, 4) "d"
                       ON "o"."project_id" = "d"."project_id"
                           AND "o"."continuous_status_partition" = "d"."following_partition";

/*TASK SNAPSHOTS*/
--create temporary table for additional calculations
--add previous values of due date, assignee and section, so we can define if there has been any change
--don't snapshot tasks of already archived projects (using inner join on project snapshot tmp table)
CREATE TABLE "task_snapshot_tmp"
AS
     SELECT
        "ts"."task_id",
        nullif(to_char("ts"."snapshot_date"),'') AS "snapshot_date",
        nullif(to_char("ts"."due_date"), '') AS "due_date",
        nullif(lag(to_char("ts"."due_date")) OVER (PARTITION BY "ts"."task_id" ORDER BY "ts"."snapshot_date"),
               '')                  AS "previous_due_date",
        "ts"."completed",
        ifnull(lag(to_char("ts"."completed")) OVER (PARTITION BY "ts"."task_id" ORDER BY "ts"."snapshot_date"),
               '')                  AS "previous_completed",
        "ts"."section",
        ifnull(lag(to_char("ts"."section")) OVER (PARTITION BY "ts"."task_id" ORDER BY "ts"."snapshot_date"),
               '')                  AS "previous_section",
        "ts"."assignee",
        ifnull(lag(to_char("ts"."assignee")) OVER (PARTITION BY "ts"."task_id" ORDER BY "ts"."snapshot_date"),
               '')                  AS "previous_assignee"
    FROM "task_snapshot" "ts"
             INNER JOIN (SELECT DISTINCT
                             "project_id"
                         FROM "project_snapshot_tmp") "ps"
                        ON "ts"."project_id" = "ps"."project_id";

--marking last day of month/quarter and last snapshot for reporting
CREATE TABLE "task_snapshot_tmp2"
AS
    SELECT
        "t".*,
        iff("m"."max_date" IS NULL, 'false', 'true') AS "last_snapshot",
        iff("lm"."task_id" IS NULL, 'false', 'true') AS "last_day_of_month",
        iff("lq"."task_id" IS NULL, 'false', 'true') AS "last_day_of_quarter"
    FROM "task_snapshot_tmp" "t"
             LEFT JOIN (SELECT
                            MAX("snapshot_date") AS "max_date"
                        FROM "task_snapshot_tmp") "m"
                       ON "t"."snapshot_date" = "m"."max_date"
             LEFT JOIN (SELECT
                            "s"."task_id",
                            "s"."snapshot_date"
                        FROM "task_snapshot_tmp" "s"
                                 LEFT JOIN (SELECT
                                                max("snapshot_date") AS "max_date"
                                            FROM "task_snapshot_tmp") "m"
                                           ON "s"."snapshot_date" = "m"."max_date"
                        WHERE "s"."snapshot_date" = last_day("s"."snapshot_date"::DATE)
                           OR "m"."max_date" IS NOT NULL) AS "lm"
                       ON "t"."task_id" = "lm"."task_id"
                           AND "t"."snapshot_date" = "lm"."snapshot_date"
             LEFT JOIN (SELECT
                            "s"."task_id",
                            "s"."snapshot_date"
                        FROM "task_snapshot_tmp" "s"
                                 LEFT JOIN (SELECT
                                                max("snapshot_date") AS "max_date"
                                            FROM "task_snapshot_tmp") "m"
                                           ON "s"."snapshot_date" = "m"."max_date"
                        WHERE "s"."snapshot_date" = last_day("s"."snapshot_date"::DATE, 'quarter')
                           OR "m"."max_date" IS NOT NULL) "lq"
                       ON "t"."task_id" = "lq"."task_id"
                           AND "t"."snapshot_date" = "lq"."snapshot_date";

--create task snapshot table
--define if there has been change of section, assignee or due date
CREATE TABLE "out_task_snapshot"
(
 "task_id" VARCHAR(255) NOT NULL,
 "snapshot_date" DATE NOT NULL,
 "section" VARCHAR(255),
 "previous_section" VARCHAR(255),
 "section_change" BOOLEAN,
 "due_date" DATE,
 "previous_due_date" DATE,
 "due_date_change" BOOLEAN,
 "due_date_diff" INTEGER,
 "assignee" VARCHAR(255),
 "previous_assignee" VARCHAR(255),
 "assignee_change" BOOLEAN,
 "last_snapshot" BOOLEAN,
 "last_day_of_month" BOOLEAN,
 "last_day_of_quarter" BOOLEAN
);

INSERT INTO "out_task_snapshot"
    SELECT
        "o"."task_id",
        "o"."snapshot_date",
        "o"."section",
        "o"."previous_section",
        iff("o"."section" <> "o"."previous_section", 'true', 'false')   AS "section_change",
        "o"."due_date",
        "o"."previous_due_date",
        iff("o"."due_date" <> "o"."previous_due_date", 'true', 'false') AS "due_date_change",
        datediff(DAY, "o"."previous_due_date", "o"."due_date")          AS "due_date_diff",
        "o"."assignee",
        "o"."previous_assignee",
        iff("o"."assignee" <> "o"."previous_assignee", 'true', 'false') AS "assignee_change",
        "o"."last_snapshot",
        "o"."last_day_of_month",
        "o"."last_day_of_quarter"
    FROM "task_snapshot_tmp2" "o";
