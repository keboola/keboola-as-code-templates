CREATE OR REPLACE TABLE "phase_configs_tmp" AS
WITH
    P AS (SELECT
              P."id" as "phase_id"
            , P."orchestration_id"
            , P."depends_on"
            , P."phase_index"
            , array_agg(T."config_id")::STRING   AS "config_ids"

    FROM
       "orchestrations_v2_phases" P
            JOIN "orchestrations_v2_tasks" T
                 ON P."id" = T."phase" AND P."orchestration_id" = T."orchestration_id"
    GROUP BY
        1, 2, 3, 4)
SELECT
    "phase_id"
  , "depends_on" as "depends_on_phase"
  , "orchestration_id"
  , "phase_index"
  , to_varchar("config_ids") as "config_ids"
 , lag("config_ids") OVER (PARTITION BY p."orchestration_id" ORDER BY "phase_index") as "depends_on"
FROM P
ORDER BY "orchestration_id", "phase_index";