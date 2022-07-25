-- creating output table with tasks
-- date to simple format
-- change boolean values to true/false
-- add section from membership table
CREATE TABLE "out_task"
AS
    SELECT DISTINCT
        "t"."id"                                                                                  AS "task_id",
        iff(length("t"."name") > 1024, left("t"."name", 1021) || '...', "t"."name")               AS "task",
        ifnull("tdm"."section_name", '(no section)')                                              AS "section",
        "p"."project_id"                                                                          AS "project_id",
        replace(left("td"."created_at", 19), 'T', ' ')                                            AS "created_at",
        replace(left("td"."completed_at", 19), 'T', ' ')                                          AS "completed_at",
        "td"."due_on"                                                                             AS "due_date",
        iff("td"."completed" = '1', NULL, datediff(DAY, nullif("td"."due_on", ''), current_date)) AS "days_past_due",
        iff("days_past_due" IS NULL OR "days_past_due" < 1, 'false', 'true')                      AS "is_past_due",
        'https://app.asana.com/0/' || "p"."project_id" || '/' || "t"."id"                         AS "url",
        ifnull("u"."user", 'Unknown')                                                             AS "assignee",
        "u"."user_type"                                                                           AS "assignee_type",
        iff("td"."completed" = '1', 'true', 'false')                                              AS "completed",
        iff("td"."parent_id" = '', 'false', 'true')                                               AS "is_subtask"
    FROM "project" "p"
             INNER JOIN "tasks" "t"
                        ON "p"."project_id" = "t"."project_id"
             LEFT JOIN "task_details" "td"
                       ON "t"."id" = "td"."id"
             LEFT JOIN "task_details_memberships" "tdm"
                       ON "p"."project_id" = "tdm"."project_id"
                           AND "t"."id" = "tdm"."task_details_pk"
             LEFT JOIN "user" "u"
                       ON "td"."assignee_id" = "u"."user_id";

-- table with custom task fields
-- choose correct value column based on type of the field
CREATE TABLE "out_task_custom_field"
AS
    SELECT
        "id"                                                    AS "task_custom_field_id",
        "task_details_pk"                                       AS "task_id",
        "name"                                                  AS "task_custom_field",
        iff("type" = 'enum', "enum_value_name", "number_value") AS "task_custom_field_value"
    FROM "task_details-custom_fields";

-- table with tags assigned to task
CREATE TABLE "out_task_tag"
AS
    SELECT
        "ot"."task_id" AS "task_id",
        "tdt"."name"   AS "tag"
    FROM "out_task" "ot"
             INNER JOIN "task_details_tags" "tdt"
                        ON "ot"."task_id" = "tdt"."task_details_pk";

-- create N:M relation table describing user membership in tasks
CREATE TABLE "out_task_user"
AS
    SELECT
        "tdf"."id"     AS "user_id",
        "ot"."task_id" AS "task_id"
    FROM "task_details_followers" "tdf"
             INNER JOIN "out_task" "ot"
                        ON "tdf"."task_details_pk" = "ot"."task_id";

-- table with task events
-- trim text if it's too long
CREATE TABLE "out_task_event"
AS
    SELECT
        "id"                                                            AS "task_event_id",
        "task_id",
        ifnull("u"."user_id", '0')                                      AS "user_id",
        "u"."user_type",
        ifnull("u"."user", 'Unknown')                                   AS "user",
        replace(left("created_at", 19), 'T', ' ')                       AS "created_at",
        "type"                                                          AS "event_type",
        "resource_subtype"                                              AS "event",
        iff(length("text") > 1024, left("text", 1021) || '...', "text") AS "event_text"
    FROM "task_stories" "ts"
             LEFT JOIN "user" "u"
                       ON "ts"."created_by_id" = "u"."user_id";

-- snapshot task table to be able to track progress in time
-- this table is an auxiliary table which will be used for creating final snapshot table later on
-- set timezone to UTC (change accordingly)
ALTER SESSION
    SET TIMEZONE = 'UTC';

CREATE TABLE "out_task_snapshot"
AS
    SELECT
        current_date :: STRING AS "snapshot_date",
        "ot".*
    FROM "out_task" "ot";
