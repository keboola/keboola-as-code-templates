/*TASK SNAPSHOTS*/
-- snapshot task table to be able to track progress in time
-- this table is an auxiliary table which will be used for creating final snapshot table later on
-- set timezone to UTC (change accordingly)
ALTER SESSION
    SET TIMEZONE = 'UTC';

CREATE TABLE "tmp1_task_snapshot" AS
    SELECT
        current_date :: STRING AS "snapshot_date",
        "ot".*
    FROM "out_task" "ot";

--create temporary table for additional calculations
--add previous values of due date, assignee and section, so we can define if there has been any change
--don't snapshot tasks of already archived projects (using inner join on project snapshot tmp table)
CREATE TABLE "tmp2_task_snapshot"
AS
    SELECT
        "ts"."task_id",
        "ts"."snapshot_date",
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
    FROM "tmp1_task_snapshot" "ts"
             INNER JOIN (SELECT DISTINCT
                             "project_id"
                         FROM "tmp2_project_snapshot") "ps"
                        ON "ts"."project_id" = "ps"."project_id";

--marking last day of month/quarter and last snapshot for reporting
CREATE TABLE "tmp3_task_snapshot"
AS
    SELECT
        "t".*,
        iff("m"."max_date" IS NULL, 'false', 'true') AS "last_snapshot",
        iff("lm"."task_id" IS NULL, 'false', 'true') AS "last_day_of_month",
        iff("lq"."task_id" IS NULL, 'false', 'true') AS "last_day_of_quarter"
    FROM "tmp2_task_snapshot" "t"
             LEFT JOIN (SELECT
                            MAX("snapshot_date") AS "max_date"
                        FROM "tmp2_task_snapshot") "m"
                       ON "t"."snapshot_date" = "m"."max_date"
             LEFT JOIN (SELECT
                            "s"."task_id",
                            "s"."snapshot_date"
                        FROM "tmp2_task_snapshot" "s"
                                 LEFT JOIN (SELECT
                                                max("snapshot_date") AS "max_date"
                                            FROM "tmp2_task_snapshot") "m"
                                           ON "s"."snapshot_date" = "m"."max_date"
                        WHERE "s"."snapshot_date" = last_day("s"."snapshot_date"::DATE)
                           OR "m"."max_date" IS NOT NULL) AS "lm"
                       ON "t"."task_id" = "lm"."task_id"
                           AND "t"."snapshot_date" = "lm"."snapshot_date"
             LEFT JOIN (SELECT
                            "s"."task_id",
                            "s"."snapshot_date"
                        FROM "tmp2_task_snapshot" "s"
                                 LEFT JOIN (SELECT
                                                max("snapshot_date") AS "max_date"
                                            FROM "tmp2_task_snapshot") "m"
                                           ON "s"."snapshot_date" = "m"."max_date"
                        WHERE "s"."snapshot_date" = last_day("s"."snapshot_date"::DATE, 'quarter')
                           OR "m"."max_date" IS NOT NULL) "lq"
                       ON "t"."task_id" = "lq"."task_id"
                           AND "t"."snapshot_date" = "lq"."snapshot_date";

--create task snapshot table
--define if there has been change of section, assignee or due date
CREATE TABLE "out_task_snapshot"
(
 "task_id" TEXT NOT NULL,
 "snapshot_date" DATE NOT NULL,
 "section" TEXT,
 "previous_section" TEXT,
 "section_change" BOOLEAN,
 "due_date" DATE,
 "previous_due_date" DATE,
 "due_date_change" BOOLEAN,
 "due_date_diff" INTEGER,
 "assignee" TEXT,
 "previous_assignee" TEXT,
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
    FROM "tmp3_task_snapshot" "o";
