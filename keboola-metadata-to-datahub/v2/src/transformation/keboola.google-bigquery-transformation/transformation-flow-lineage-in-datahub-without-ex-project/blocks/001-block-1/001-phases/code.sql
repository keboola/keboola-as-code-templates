CREATE OR REPLACE TABLE `phase_configs_tmp` AS
WITH P AS (
  SELECT
    P.`id` AS `phase_id`,
    P.`orchestration_id`,
    P.`depends_on`,
    P.`phase_index`,
    CAST(ARRAY_AGG(T.`config_id`) FILTER(WHERE T.`config_id` IS NOT NULL) AS STRING) AS `config_ids`
  FROM `orchestrations_v2_phases` AS P
  JOIN `orchestrations_v2_tasks` AS T
    ON P.`id` = T.`phase` AND P.`orchestration_id` = T.`orchestration_id`
  GROUP BY
    1,
    2,
    3,
    4
)
SELECT
  `phase_id`,
  `depends_on` AS `depends_on_phase`,
  `orchestration_id`,
  `phase_index`,
  CAST(`config_ids` AS STRING) AS `config_ids`,
  LAG(`config_ids`) OVER (PARTITION BY p.`orchestration_id` ORDER BY `phase_index`) AS `depends_on`
FROM P
ORDER BY
  `orchestration_id` NULLS LAST,
  `phase_index` NULLS LAST;