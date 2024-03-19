-- create task table
CREATE TABLE "out_task"
(
  "task_id" TEXT NOT NULL,
  "task" TEXT,
  "section"  TEXT,
  "project_id"  TEXT,
  "created_at" TEXT,
  "completed_at" TEXT,
  "due_date" TEXT,
  "days_past_due" INTEGER,
  "is_past_due" BOOLEAN,
  "url"  TEXT,
  "assignee"  TEXT,
  "assignee_type"  TEXT,
  "completed" BOOLEAN,
  "is_subtask" BOOLEAN
);

INSERT INTO "out_task"
  SELECT DISTINCT 
    i."id" AS "task_id",
    i."summary" AS "task",
    i."issue_type_name" AS "section",
    p."id" AS "project_id",
    replace(left(i."created", 19), 'T', ' ') AS "created_at",
    replace(left(i."resolution_date", 19), 'T', ' ') AS "completed_at",
    "due_date",
    iff(i."resolution_date" != NULL, NULL, datediff(DAY, nullif(i."due_date", ''), current_date)) AS "days_past_due",
    iff("days_past_due" IS NULL OR "days_past_due" < 1, false, true) AS "is_past_due",
    null   AS "url",
    i."assignee_display_name" AS "assignee",
    u."account_type" AS "assignee_type",
    iff(i."resolution_date" = '', false, true) AS "completed",
    iff(i."parent_id" = '', false, true) AS "is_subtask"
  FROM "issues" i
    LEFT JOIN "projects" p ON i."project_key" = p."key"
    LEFT JOIN "users" u ON i."reporter_account_id" = u."account_id";

-- creates table with details in custom field of every task
CREATE TABLE "out_task_custom_field"
(
  "task_custom_field_id" TEXT NOT NULL,
  "task_id" TEXT,
  "task_custom_field" TEXT,
  "task_custom_field_value" TEXT
);

INSERT INTO "out_task_custom_field"
  SELECT
    concat(i."id", json.key) AS "task_custom_field_id"
  , i."id" AS "task_id"
  , json.key AS "task_custom_field"
  , json.value::string AS "task_custom_field_value"

  FROM "issues" i
  , TABLE (flatten(parse_json("custom_fields"))) json

  WHERE json.value not LIKE '' AND
        json.value not LIKE '[]' AND
        json.value not LIKE '{}'
;

-- create task_event table
CREATE TABLE "out_task_event"
(
  "task_event_id" TEXT NOT NULL,
  "task_id" TEXT,
  "user_id" TEXT,
  "user_type" TEXT,
  "user" TEXT,
  "created_at" TIMESTAMP,
  "event_type" TEXT,
  "event" TEXT,
  "event_text" TEXT
);

INSERT INTO "out_task_event"
  SELECT
      c."id" AS "task_event_id",
      c."issue_id" AS "task_id",
      ifnull(u."account_id", '0') AS "user_id",
      u."account_type" AS "user_type",
      u."display_name" AS "user",
      replace(left(c."created", 19), 'T', ' ') AS "created_at",
      c."field_type" AS "event_type",
      c."field" AS "event",
      i."description" AS "event_text"

  FROM "issues-changelogs" c
      LEFT JOIN "users" u 
          ON u."account_id" = c."author_account_id"
      LEFT JOIN "issues" i
          ON i."id" = c."issue_id";

-- create task_tag table
CREATE TABLE "out_task_tag"
(
  "task_id" TEXT NOT NULL,
  "tag" TEXT NOT NULL
);

INSERT INTO "out_task_tag"
  SELECT DISTINCT
          "id" AS "task_id",
          "labels" AS "tag"
  FROM "issues" i
  WHERE "labels"<>'[]';

-- create join table of users and tasks
CREATE TABLE "out_task_user"
(
  "user_id" TEXT NOT NULL,
  "task_id" TEXT NOT NULL
);

INSERT INTO "out_task_user"
  SELECT 
      i."reporter_account_id" AS "user_id", 
      i."id" AS "task_id"
  FROM "issues" i;
