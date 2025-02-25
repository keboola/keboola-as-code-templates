CREATE OR replace TABLE "dataset_lineage" AS 

SELECT *
FROM   (SELECT STORAGE."id"
               AS "config_id",
               STORAGE."project_id",
               STORAGE."project_name",
               STORAGE."name",
               STORAGE."component_name",
               STORAGE."component_type",
               STORAGE.storage_inputs_sources
               AS
                      "storage_inputs_sources",
               Coalesce(STORAGE.storage_outputs_destinations,
               Last_value(STORAGE.storage_outputs_destinations ignore nulls)
               over (
                 PARTITION BY STORAGE."id"
                 ORDER BY STORAGE."id" ROWS BETWEEN unbounded preceding AND
               CURRENT ROW
               ),
               First_value(STORAGE.storage_outputs_destinations ignore nulls)
               over (
                 PARTITION BY STORAGE."id"
                 ORDER BY STORAGE."id" ROWS BETWEEN unbounded preceding AND
               CURRENT ROW
               ),
               Concat (STORAGE."component_name", '_', STORAGE."component_type"))
               AS
               "storage_outputs_destinations",
               CASE
                 WHEN orch."orchestration_id" IS NULL THEN Cast(123 AS INTEGER)
                 ELSE Cast(orch."orchestration_id" AS INTEGER)
               END
               AS
                      "orchestration_id"
        FROM
"storage_inputs_and_outputs" STORAGE
left join
"orchestrations_v2_tasks" orch
       ON STORAGE."id" = orch."config_id");