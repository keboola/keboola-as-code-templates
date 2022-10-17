CREATE OR REPLACE TABLE "tmp-user-events"
(
    "creator_token_id"  VARCHAR,
    "project_id"        VARCHAR,
    "event_category"    VARCHAR,
    "event_description" VARCHAR,
    "event_status"      VARCHAR,
    "event_time"        VARCHAR,
    "event_date"        DATE,
    "event_context"     VARCHAR,
    "event_url"         VARCHAR
);

INSERT INTO "tmp-user-events"
SELECT t."creator_token_id",
       t."project_id",
       'job',
       'created a job',
       LOWER(j."job_status"),
       "job_created",
       "job_created_date",
       'Job ID: ' || "job_id",
       "job_url"
FROM "jobs" j
     INNER JOIN "md_tokens" t ON j."token_id" = t."id"
     LEFT JOIN "configurations" c ON j."component_configuration_id" = c."component_configuration_id"
WHERE TRUE;

INSERT INTO "tmp-user-events"
SELECT t."creator_token_id",
       t."project_id",
       'configuration',
       "configuration_version_event" || ' a configuration',
       'success',
       "configuration_last_updated",
       LEFT("configuration_last_updated", 10),
       'Version ' || cv."configuration_version",
       cc."configuration_url" || '/versions'
FROM "configurations_versions" cv
     INNER JOIN "configurations" cc ON cc."component_configuration_id" = cv."component_configuration_id"
     INNER JOIN "md_tokens" t ON cv."token_id" = t."id"
WHERE TRUE;

--INSERT INTO "tmp-user-events"
--SELECT u."creator_token_id",
--       se."project_id",
--       'security',
--       "security_event_description",
--       'success',
--       "event_created",
--       "event_created_date",
--       "event_context",
--       NULL
--FROM "security_events" se
--     INNER JOIN "users" u ON LOWER(se."admin_email") = LOWER(u."user_email");

CREATE TABLE "out_user_events" AS
SELECT MD5(CONCAT_WS('|', "creator_token_id", "event_category", "event_description",
                     "event_time", "event_status")) AS "user_event_id",
       *
FROM "tmp-user-events";

--CREATE OR REPLACE TABLE "tmp_logins" AS
--SELECT "event_created"::DATE AS date,
--       "admin_email"         AS user_email,
--       SUM(
--           CASE
--               WHEN "security_event" IN ('auditLog.admin.login', 'auditLog.admin.loginWithTotp',
--                                         'auditLog.admin.failedLogin',
--                                         'auditLog.admin.loginWithTotpViaRecoveryCode',
--                                         'auditLog.admin.sudo', 'auditLog.project.detail',
--                                         'adminLog.organization.projectsListed')
--                   THEN 1
--               ELSE 0
--           END
--           )                 AS "metric",
--       'logins_and_opens'    AS "metric_type"
--FROM "security_events"
--GROUP BY 1, 2;

CREATE OR REPLACE TABLE "tmp_config_changes" AS
SELECT "configuration_version_updated"::DATE AS date,
       SPLIT_PART("token_name", ' ', 1)      AS user_email,
       COUNT(*)                              AS "metric",
       'configuration_changes'               AS "metric_type"
FROM "configurations_versions"
GROUP BY 1, 2;

CREATE OR REPLACE TABLE "tmp_job_runs" AS
SELECT "job_created"::DATE              AS date,
       SPLIT_PART("token_name", ' ', 1) AS user_email,
       COUNT(*)                         AS "metric",
       'job_runs'                       AS "metric_type"
FROM "jobs"
WHERE TRUE
  AND user_email NOT LIKE 'Orchestrator%'
  AND user_email LIKE '%@%'
GROUP BY 1, 2
UNION ALL
SELECT "job_created"::DATE              AS date,
       SPLIT_PART("token_name", ' ', 1) AS user_email,
       SUM("job_billed_credits")        AS "metric",
       'job_credits'                    AS "metric_type"
FROM "jobs"
WHERE TRUE
  AND user_email NOT LIKE 'Orchestrator%'
  AND user_email LIKE '%@%'
GROUP BY 1, 2;

CREATE OR REPLACE TABLE "tmp_users_metrics" AS

SELECT *
FROM "tmp_config_changes"
UNION ALL
SELECT *
FROM "tmp_job_runs";

CREATE OR REPLACE TABLE "tmp_users_metrics" AS
SELECT *
FROM "tmp_users_metrics"
    PIVOT ( SUM("metric") FOR "metric_type" IN ('logins_and_opens', 'configuration_changes',
        'job_credits', 'job_runs') );

CREATE OR REPLACE TABLE "out_users_metrics" AS
SELECT MD5(CONCAT_WS('-', user_email, date)) AS "user_metric_id",
       date                                  AS "date",
       user_email                            AS "user_email",
       ZEROIFNULL("'logins_and_opens'")      AS "logins_and_opens",
       ZEROIFNULL("'configuration_changes'") AS "config_changes",
       ZEROIFNULL("'job_credits'")           AS "job_credits",
       ZEROIFNULL("'job_runs'")              AS "job_runs"
FROM "tmp_users_metrics";