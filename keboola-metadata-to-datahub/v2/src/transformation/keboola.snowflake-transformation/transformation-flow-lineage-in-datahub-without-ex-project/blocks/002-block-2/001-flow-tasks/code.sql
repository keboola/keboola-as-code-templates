CREATE OR REPLACE TABLE "flow_tasks" AS
SELECT    configs."id"             AS "config_id",
          configs."name"           AS "config_name",
          configs."created"        AS "config_created",
          "component_type"         AS "config_component_type",
          "is_deleted"             AS "config_is_deleted",
          "description"            AS "config_description",
          CASE
                    WHEN orch_tasks."orchestration_id" IS NULL THEN 123
                    ELSE CAST(orch_tasks."orchestration_id" AS INTEGER)
          END AS "orchestration_id",
          CASE 
          			WHEN  orch_tasks."project_id" is NULL
                THEN ''
                ELSE orch_tasks."project_id"
          END AS "project_id",
          CASE 
          			WHEN  orch_tasks."id" is NULL
                THEN ''
                ELSE orch_tasks."id"
          END AS "task_id",
          CASE 
          			WHEN  "mode" is NULL
                THEN ''
                ELSE "mode"
          END AS "mode",
           CASE 
          			WHEN  "continue_on_failure" is NULL
                THEN ''
                ELSE "continue_on_failure"
          END AS "continue_on_failure",
           CASE 
          			WHEN  "enabled" is NULL
                THEN ''
                ELSE "enabled"
          END AS "enabled",
         	CASE 
          			WHEN  orch_phases."phase_id" is NULL
                THEN ''
                ELSE orch_phases."phase_id"
          END AS "phase_id",
          CASE 
          			WHEN  orch_phases."phase_index" is NULL
                THEN ''
                ELSE orch_phases."phase_index"
          END AS "phase_index",
           CASE 
          			WHEN  "config_ids" is NULL
                THEN ''
                ELSE "config_ids"
          END AS "config_ids",
              CASE 
          			WHEN  "depends_on" is NULL
                THEN ''
                ELSE "depends_on"
          END AS "config_depends_on"
FROM      "configurations" configs
LEFT JOIN "orchestrations_v2_tasks" orch_tasks
ON        configs."id" = orch_tasks."config_id"
LEFT JOIN "phase_configs_tmp" orch_phases
ON        orch_tasks."orchestration_id" = orch_phases."orchestration_id"
AND       orch_tasks."phase" = orch_phases."phase_id"
//WHERE     configs."id" <> 'KBC_DEV_ADAM_TEST'
ORDER BY  "orchestration_id",
          "phase_index";