CREATE OR REPLACE TABLE `flow_tasks` AS
SELECT
  configs.`id` AS `config_id`,
  configs.`name` AS `config_name`,
  configs.`created` AS `config_created`,
  `component_type` AS `config_component_type`,
  `is_deleted` AS `config_is_deleted`,
  `description` AS `config_description`,
  CASE
    WHEN orch_tasks.`orchestration_id` IS NULL
    THEN 123
    ELSE CAST(orch_tasks.`orchestration_id` AS INT64)
  END AS `orchestration_id`,
  CASE WHEN orch_tasks.`project_id` IS NULL THEN '' ELSE orch_tasks.`project_id` END AS `project_id`,
  CASE WHEN orch_tasks.`id` IS NULL THEN '' ELSE orch_tasks.`id` END AS `task_id`,
  CASE WHEN `mode` IS NULL THEN '' ELSE `mode` END AS `mode`,
  CASE WHEN `continue_on_failure` IS NULL THEN '' ELSE `continue_on_failure` END AS `continue_on_failure`,
  CASE WHEN `enabled` IS NULL THEN '' ELSE `enabled` END AS `enabled`,
  CASE WHEN orch_phases.`phase_id` IS NULL THEN '' ELSE orch_phases.`phase_id` END AS `phase_id`,
  CASE
    WHEN orch_phases.`phase_index` IS NULL
    THEN ''
    ELSE orch_phases.`phase_index`
  END AS `phase_index`,
  CASE WHEN `config_ids` IS NULL THEN '' ELSE `config_ids` END AS `config_ids`,
  CASE WHEN `depends_on` IS NULL THEN '' ELSE `depends_on` END AS `config_depends_on`
FROM `configurations` AS configs
LEFT JOIN `orchestrations_v2_tasks` AS orch_tasks
  ON configs.`id` = orch_tasks.`config_id`
LEFT JOIN `phase_configs_tmp` AS orch_phases
  ON orch_tasks.`orchestration_id` = orch_phases.`orchestration_id`
  AND orch_tasks.`phase` = orch_phases.`phase_id`
ORDER BY
  `orchestration_id` NULLS LAST,
  `phase_index` NULLS LAST;