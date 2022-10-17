SET curr_date = CONVERT_TIMEZONE('UTC', CURRENT_TIMESTAMP)::DATE;

CREATE TABLE tmp_failed_jobs AS
WITH failed AS (
    SELECT DISTINCT "component_configuration_id",
                    "job_created",
                    "job_id",
                    "job_url",
                    ROW_NUMBER() OVER (PARTITION BY "component_configuration_id"
                        ORDER BY "job_created" DESC) AS RN
    FROM "jobs"
    WHERE TRUE
      AND "job_status" IN ('error', 'warning')
)
SELECT *
FROM failed
WHERE TRUE
  AND RN = 1;

CREATE TABLE tmp_successful_jobs AS
WITH success AS (
    SELECT DISTINCT "component_configuration_id",
                    "job_created",
                    "job_id",
                    "job_url",
                    ROW_NUMBER() OVER (PARTITION BY "component_configuration_id"
                        ORDER BY "job_created" DESC) AS RN
    FROM "jobs"
    WHERE TRUE
      AND "job_status" IN ('success')
)
SELECT *
FROM success
WHERE TRUE
  AND RN = 1;

CREATE TABLE tmp_all_jobs AS
WITH jobs AS (
    SELECT DISTINCT "component_configuration_id",
                    "job_created",
                    "job_id",
                    "job_url",
                    ROW_NUMBER() OVER (PARTITION BY "component_configuration_id"
                        ORDER BY "job_created" DESC) AS RN
    FROM "jobs"
)
SELECT *
FROM jobs
WHERE TRUE
  AND RN = 1;

CREATE TABLE "out_configuration_health" AS
SELECT DISTINCT cc."component_configuration_id",
                f."job_created"                              AS "last_failed_job_created",
                f."job_id"                                   AS "last_failed_job_id",
                f."job_url"                                  AS "last_failed_job_url",
                s."job_created"                              AS "last_success_job_created",
                s."job_id"                                   AS "last_success_job_id",
                s."job_url"                                  AS "last_success_job_url",
                j."job_created"                              AS "last_job_created",
                j."job_id"                                   AS "last_job_id",
                j."job_url"                                  AS "last_job_url",
                DATEDIFF(DAYS, j."job_created", $curr_date)  AS "days_since_last_job",
                DATEDIFF(DAYS, s."job_created", $curr_date)  AS "days_since_last_success",
                DATEDIFF(DAYS, f."job_created", $curr_date)  AS "days_since_last_fail",
                IFF("days_since_last_job" > 60, TRUE, FALSE) AS "is_unused",
                IFF("days_since_last_success" > 3 AND "is_unused" = FALSE,
                    TRUE, FALSE)                             AS "is_in_trouble",
                IFF(mdc."description" = '' OR mdc."description" IS NULL,
                    FALSE, TRUE)                             AS "has_description",
                IFF("is_unused" = FALSE AND "is_in_trouble" = FALSE,
                    TRUE, FALSE)                             AS "is_healthy"
FROM "configurations" cc
     LEFT JOIN tmp_failed_jobs f ON f."component_configuration_id" = cc."component_configuration_id"
     LEFT JOIN tmp_successful_jobs s ON s."component_configuration_id" = cc."component_configuration_id"
     LEFT JOIN tmp_all_jobs j ON j."component_configuration_id" = cc."component_configuration_id"
     LEFT JOIN "md_configurations" mdc
               ON TRUE
                   AND APPEND_REGION(mdc."id", mdc."region", -1) = cc."configuration_id"
WHERE TRUE
  AND cc."configuration_is_deleted"::BOOLEAN = FALSE;