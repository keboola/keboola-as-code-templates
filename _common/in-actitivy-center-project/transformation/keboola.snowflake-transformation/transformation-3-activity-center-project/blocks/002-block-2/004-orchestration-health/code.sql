SET ORCHESTRATOR_COMPONENT_ID = 'orchestrator';

CREATE TABLE tmp_orchestration_types AS
SELECT "configuration_id" AS orchestration_id,
       "region"           AS region,
       'event'            AS type
FROM "md_triggers"
WHERE TRUE
  AND "component" = $ORCHESTRATOR_COMPONENT_ID
UNION
SELECT "id",
       "region",
       IFF("crontab_record" <> '', 'scheduled', 'manual')
FROM "md_orchestrations";

CREATE TABLE "out_orchestrations" AS
WITH notifications AS (
    SELECT DISTINCT "orchestration_id"                       AS "orchestration_id",
                    "region"                                 AS "orchestration_region",
                    SUM(IFF("channel" = 'error', 1, 0))      AS "notifications_error",
                    SUM(IFF("channel" = 'warning', 1, 0))    AS "notifications_warning",
                    SUM(IFF("channel" = 'processing', 1, 0)) AS "notifications_processing"
    FROM "md_orchestrations_notifications"
    GROUP BY "orchestration_id", "region"
),
     tasks         AS (
         SELECT DISTINCT "orchestration_id"                             AS "orchestration_id",
                         "region"                                       AS "orchestration_region",
                         COUNT(DISTINCT "id")                           AS "number_of_tasks",
                         SUM(IFF("is_active"::BOOLEAN = FALSE, 1, 0))   AS "number_of_inactive",
                         COUNT(DISTINCT "phase")                        AS "number_of_phases",
                         SUM(IFF("continue_on_failure"::BOOLEAN, 1, 0)) AS "number_of_continues"
         FROM "md_orchestrations_tasks"
         GROUP BY "orchestration_id", "region"
     )
SELECT CONCAT_WS('-', o."project_id", IFF(o."region" = 'us-east-1', 'US', 'EU'),
                 $ORCHESTRATOR_COMPONENT_ID, o."id")                    AS "component_configuration_id",
       o."id" || '-' || IFF(o."region" = 'us-east-1', 'US', 'EU')       AS "orchestration_id",
       ot.type                                                          AS "orchestration_type",
       o."token_id" || '-' || IFF(o."region" = 'us-east-1', 'US', 'EU') AS "run_token_id",
       o."active"                                                       AS "is_active",
       IFF(ZEROIFNULL("notifications_error") > 0, TRUE, FALSE)          AS "has_error_notifications",
       IFF(ZEROIFNULL("notifications_warning") > 0, TRUE, FALSE)        AS "has_warning_notifications",
       IFF(ZEROIFNULL("notifications_processing") > 0, TRUE, FALSE)     AS "has_processing_notifications",
       IFF(ZEROIFNULL("number_of_tasks") > 0, TRUE, FALSE)              AS "has_tasks",
       IFF(ZEROIFNULL("number_of_inactive") > 0, TRUE, FALSE)           AS "has_inactive_tasks",
       IFF(ZEROIFNULL("number_of_continues") > 0, TRUE, FALSE)          AS "has_continues",
       IFF("has_continues" = TRUE AND "has_warning_notifications" = FALSE,
           TRUE, FALSE)                                                 AS "is_missing_warning_notifications",
       IFF("has_tasks" = TRUE AND
           "has_error_notifications" = TRUE AND
           "is_missing_warning_notifications" = FALSE AND
           "has_inactive_tasks" = FALSE, TRUE, FALSE)                   AS "is_healthy"
FROM "md_orchestrations" o
     LEFT JOIN tmp_orchestration_types ot
               ON TRUE
                   AND ot.orchestration_id = o."id"
                   AND ot.region = o."region"
     LEFT JOIN notifications n
               ON TRUE
                   AND n."orchestration_id" = o."id"
                   AND n."orchestration_region" = o."region"
     LEFT JOIN tasks t
               ON TRUE
                   AND t."orchestration_id" = o."id"
                   AND t."orchestration_region" = o."region";

CREATE TABLE "out_orchestrations_tasks" AS
SELECT "id" || '-' || IFF("region" = 'us-east-1', 'US', 'EU')               AS "task_id",
       "orchestration_id" || '-' || IFF("region" = 'us-east-1', 'US', 'EU') AS "orchestration_id",
       "component_id"                                                       AS "component_id",
       "is_active"                                                          AS "is_active",
       "continue_on_failure"                                                AS "continue_on_failure",
       "phase"                                                              AS "phase",
       CONCAT_WS('-', PARSE_JSON("action_parameters"):config::VARCHAR,
                 IFF("region" = 'us-east-1', 'US', 'EU'))                   AS "configuration_id"
FROM "md_orchestrations_tasks";

CREATE TABLE "out_orchestrations_notifications" AS
SELECT "orchestration_id" || '-' || IFF("region" = 'us-east-1', 'US', 'EU') AS "orchestration_id",
       "email"                                                              AS "notification_email",
       "channel"                                                            AS "notification_type"
FROM "md_orchestrations_notifications";