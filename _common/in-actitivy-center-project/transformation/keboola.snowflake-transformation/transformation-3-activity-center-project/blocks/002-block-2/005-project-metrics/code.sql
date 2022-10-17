SET min_date = '2017-01-01'::DATE;

SET gen_date = (SELECT DATEDIFF(DAY, $min_date, CONVERT_TIMEZONE('UTC', CURRENT_TIMESTAMP())));

CREATE TABLE DATES AS
SELECT DATEADD(DAY, ROW_NUMBER() OVER (ORDER BY seq4()), $min_date) AS DATE
FROM TABLE ( GENERATOR(ROWCOUNT => $gen_date) );

-- DROP TABLE IF EXISTS "out_projects_metrics";
CREATE OR REPLACE TABLE "out_projects_metrics" AS
WITH projects  AS (
    SELECT d.date,
           p."project_id",
           p."project_is_active"
    FROM DATES d
         CROSS JOIN "projects" p
    WHERE TRUE
      AND p."project_is_active"::BOOLEAN = TRUE
),
     jobs      AS (
         SELECT APPEND_REGION(SPLIT_PART("component_configuration_id", '-', 1),
                              "component_configuration_id", 2) AS PROJECT_ID,
                "job_created_date"                             AS DATE,
                SUM("job_time_credits")                        AS CREDITS_TIME,
                --SUM("job_volume_credits")                      AS CREDITS_VOLUME,
                SUM("job_billed_credits")                      AS CREDITS_BILLED
         FROM "jobs"
         GROUP BY 1, 2
     ),
     snowflake AS (
         SELECT "project_id",
                "snowflake_job_created_date",
                SUM("snowflake_job_credits")                                     AS "snowflake_job_credits",
                SUM(IFF("snowflake_job_length" = '', 0, "snowflake_job_length")) AS "snowflake_job_length"
         FROM "snowflake_statistics"
         GROUP BY "project_id", "snowflake_job_created_date"
     ),
     tables    AS (
         SELECT tm."project_id",
                tm."table_snapshot_date",
                SUM(TRY_TO_NUMBER("table_rows"))  AS "ROWS",
                SUM(TRY_TO_NUMBER("table_bytes")) AS BYTES
         FROM "tables_metrics" tm
              JOIN "tables" t ON t."table_project_id" = tm."table_project_id"
         WHERE TRUE
           AND t."table_is_alias"::BOOLEAN = FALSE
         GROUP BY 1, 2
     )
SELECT CONCAT_WS('-', d."project_id", d.DATE)    AS "metric_id",
       d.date                                    AS "metric_date",
       d."project_id",
       ZEROIFNULL(SUM(t."ROWS"))                 AS "storage_rows",
       ZEROIFNULL(SUM(t.bytes))                  AS "storage_bytes",
       ("storage_bytes" / POWER(1000, 3))::FLOAT AS "storage_gigabytes",
       ("storage_bytes" / POWER(1000, 4))::FLOAT AS "storage_terabytes",
       ZEROIFNULL(SUM(CREDITS_TIME))             AS "credits_time",
       --ZEROIFNULL(SUM(CREDITS_VOLUME))           AS "credits_volume",
       ZEROIFNULL(SUM(CREDITS_BILLED))           AS "credits_billed",
       ZEROIFNULL(SUM("snowflake_job_credits"))  AS "credits_snowflake",
       ZEROIFNULL(SUM("snowflake_job_length"))   AS "seconds_snowflake",
       t."project_id"                            AS t_pid,
       j.PROJECT_ID                              AS j_pid,
       s."project_id"                            AS s_pid,
       NULL::BOOLEAN                             AS "is_last"
FROM projects D
     LEFT JOIN TABLES t
               ON TRUE
                   AND t."project_id" = D."project_id"
                   AND t."table_snapshot_date" = D.date
     LEFT JOIN jobs j
               ON TRUE
                   AND j.PROJECT_ID = D."project_id"
                   AND j.DATE = D.date
     LEFT JOIN snowflake S
               ON TRUE
                   AND S."project_id" = D."project_id"
                   AND S."snowflake_job_created_date" = D.DATE
GROUP BY D.date,
         D."project_id",
         t."project_id",
         j.PROJECT_ID,
         s."project_id";

DELETE
FROM "out_projects_metrics"
WHERE TRUE
  AND j_pid IS NULL
  AND t_pid IS NULL
  AND s_pid IS NULL;

ALTER TABLE "out_projects_metrics"
    DROP COLUMN t_pid, j_pid, s_pid;

SET max_date = (SELECT MAX("metric_date")
                FROM "out_projects_metrics");

UPDATE "out_projects_metrics"
SET "is_last" = IFF("metric_date" = $max_date, TRUE, FALSE);

DROP TABLE DATES;