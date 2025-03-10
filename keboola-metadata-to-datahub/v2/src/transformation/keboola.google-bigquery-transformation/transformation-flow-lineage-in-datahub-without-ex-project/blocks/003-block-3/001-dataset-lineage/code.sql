CREATE OR REPLACE TABLE `dataset_lineage` AS
SELECT
  *
FROM (
  SELECT
    STORAGE.`id` AS `config_id`,
    STORAGE.`project_id`,
    STORAGE.`project_name`,
    STORAGE.`name`,
    STORAGE.`component_name`,
    STORAGE.`component_type`,
    STORAGE.storage_inputs_sources AS `storage_inputs_sources`,
    COALESCE(
      STORAGE.storage_outputs_destinations,
      LAST_VALUE(STORAGE.storage_outputs_destinations IGNORE NULLS) OVER (PARTITION BY STORAGE.`id` ORDER BY STORAGE.`id` ROWS BETWEEN UNBOUNDED preceding AND CURRENT ROW),
      FIRST_VALUE(STORAGE.storage_outputs_destinations IGNORE NULLS) OVER (PARTITION BY STORAGE.`id` ORDER BY STORAGE.`id` ROWS BETWEEN UNBOUNDED preceding AND CURRENT ROW),
      CONCAT(STORAGE.`component_name`, '_', STORAGE.`component_type`)
    ) AS `storage_outputs_destinations`,
    CASE
      WHEN orch.`orchestration_id` IS NULL
      THEN CAST(123 AS INT64)
      ELSE CAST(orch.`orchestration_id` AS INT64)
    END AS `orchestration_id`
  FROM `storage_inputs_and_outputs` AS STORAGE
  LEFT JOIN `orchestrations_v2_tasks` AS orch
    ON STORAGE.`id` = orch.`config_id`
);