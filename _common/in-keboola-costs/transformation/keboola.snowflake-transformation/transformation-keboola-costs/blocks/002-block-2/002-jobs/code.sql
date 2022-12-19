CREATE TABLE "out_jobs" AS
SELECT "kbc_job_id"                                          AS "job_id",
       SPLIT_PART("kbc_job_id", '-', 1)                      AS "job_number",
       "kbc_component_configuration_id"                      AS "component_configuration_id",
       CONVERT_TELEMETRY_TIMESTAMP("job_start_at")           AS "job_start",
       "job_start"::DATE                                     AS "job_start_date",
       CONVERT_TELEMETRY_TIMESTAMP("job_created_at")         AS "job_created",
       "job_created"::DATE                                   AS "job_created_date",
       "job_run_time_sec"                                    AS "job_runtime",
       TO_CHAR(CONVERT_TIMEZONE('UTC', DATEADD(SECONDS, "job_run_time_sec",
                                               CONVERT_TELEMETRY_TIMESTAMP("job_start_at"))),
               'YYYY-MM-DD HH24:MI:SS TZH:TZM')              AS "job_end",
       DATEDIFF(SECONDS, "job_created", "job_start")         AS "job_waittime",
       "job_status"                                          AS "job_status",
       "job_run_type"                                        AS "job_run_type",
       --"job_is_clone"                                        AS "job_is_clone",
       "job_billed_credits_used"                             AS "job_billed_credits",
       --"job_volume_credits_used"                             AS "job_volume_credits",
       "job_time_credits_used"                               AS "job_time_credits",
       "job_network_mb"                                      AS "job_network_mb",
       --"job_storage_mb"                                      AS "job_storage_mb",
       "token_id"                                            AS "token_id",
       "token_name"                                          AS "token_name",
       "ds_backend_size"                                     AS "job_ds_backend",
       "dwh_small_ratio"                                     AS "job_dwh_small_ratio",
       "dwh_medium_ratio"                                    AS "job_dwh_medium_ratio",
       "dwh_large_ratio"                                     AS "job_dwh_large_ratio",
       CONCAT("dst_stack_single",
              'admin/projects/', SPLIT_PART("kbc_component_configuration_id", '-', 1),
              '/queue/', "job_number")                       AS "job_url",
       CASE
           WHEN "kbc_component_id" = 'transformation' THEN 'snowflake'
           WHEN "kbc_component_id" LIKE '%transformation%'
               THEN SPLIT_PART(SPLIT_PART("kbc_component_id", '.', 2), '-', 1)
           END                                               AS "job_transformation_type",
       "job_run_id"                                          AS "job_run_id",
       SPLIT_PART("job_run_id", '.', 1)                      AS "parent_job_run_id",
       IFF("job_run_id" <> "parent_job_run_id", TRUE, FALSE) AS "job_is_child"
FROM "kbc_job" j;

CREATE TABLE "out_snowflake" AS
SELECT MD5(
               CONCAT_WS('|', "kbc_project_id", "snowflake_job_start_at",
                         "snowflake_user", "snowflake_job_type", "dwh_size",
                         "snowflake_database", "snowflake_schema", "snowflake_job_result")
           )                                                 AS "snowflake_job_id",
       "kbc_project_id"                                      AS "project_id",
       CONVERT_TELEMETRY_TIMESTAMP("snowflake_job_start_at") AS "snowflake_job_created",
       "snowflake_job_created"::DATE                         AS "snowflake_job_created_date",
       "dwh_size"                                            AS "dwh_size",
       "snowflake_database"                                  AS "snowflake_job_database",
       "snowflake_schema"                                    AS "snowflake_job_schema",
       "snowflake_user"                                      AS "snowflake_job_user",
       "snowflake_job_type"                                  AS "snowflake_job_type",
       "snowflake_job_result"                                AS "snowflake_job_result",
       "snowflake_queries"                                   AS "snowflake_job_queries",
       "snowflake_queries_length_s"                          AS "snowflake_job_length",
       "time_credits_used"                                   AS "snowflake_job_credits"
FROM "kbc_snowflake_stats" s;
