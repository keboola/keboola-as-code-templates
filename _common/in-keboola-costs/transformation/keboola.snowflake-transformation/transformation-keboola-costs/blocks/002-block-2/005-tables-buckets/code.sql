SET current_ts = CONVERT_TIMEZONE('UTC', CURRENT_TIMESTAMP());

UPDATE "kbc_table_snapshot"
SET "last_import" = "created"
WHERE "last_import" = '';

CREATE OR REPLACE TABLE "tmp_tables" AS
SELECT CONCAT_WS('--', "kbc_project_id", "table_id")           AS "table_project_id",
       CONCAT_WS('--', "table_project_id", "snapshot_date")    AS "table_snapshot_id",
       "snapshot_date"                                         AS "table_snapshot_date",
       "table_id"                                              AS "table_id",
       "kbc_project_id"                                        AS "project_id",
       "table_name"                                            AS "table_name",
       REPLACE("table_id", '.' || "table_name")                AS "bucket_id",
       CONCAT_WS('--', "kbc_project_id",
                 "bucket_id")                                  AS "bucket_project_id",
       CONVERT_TELEMETRY_TIMESTAMP("created")                  AS "table_created",
       CONVERT_TELEMETRY_TIMESTAMP("last_import")              AS "table_last_import",
       "is_alias"                                              AS "table_is_alias",
       CONCAT_WS('--', "source_project_id", "source_table_id") AS "source_table_project_id",
       "primary_key"                                           AS "table_primary_key",
       ZEROIFNULL(TRY_TO_NUMBER("rows"))                       AS "table_rows",
       ZEROIFNULL(TRY_TO_NUMBER("bytes"))                      AS "table_bytes",
       ZEROIFNULL(TRY_TO_NUMBER("bytes")) / POWER(1000, 3)     AS "table_gigabytes",
       ZEROIFNULL(TRY_TO_NUMBER("bytes")) / POWER(1000, 4)     AS "table_terabytes",
       ROW_NUMBER() OVER (
           PARTITION BY "table_project_id"
           ORDER BY "snapshot_date" DESC
           )                                                   AS rn
FROM "kbc_table_snapshot" ts;

--INNER JOIN "_filter" f ON f."company_id" = ts."dst_proj_company";

-- DROP TABLE IF EXISTS "out_tables";
CREATE TABLE "out_tables" AS
SELECT DISTINCT t."table_project_id",
                t."table_id",
                t."project_id",
                t."table_name",
                t."bucket_project_id",
                t."table_primary_key",
                t."source_table_project_id",
                t."table_is_alias",
                CONVERT_TELEMETRY_TIMESTAMP(t."table_created")        AS "table_created",
								CONVERT_TELEMETRY_TIMESTAMP(t."table_last_import")     AS "table_last_import",
                DATEDIFF(DAYS, "table_last_import", $current_ts)                 AS "datediff_last_import",
                IFF("datediff_last_import" > 90, TRUE, FALSE)                    AS "table_not_imported",
                CONCAT(REGION_URL(t."project_id", -1), SPLIT_PART(t."project_id", '-', 1),
                       '/storage-explorer/', t."bucket_id", '/', t."table_name") AS "table_url"
FROM "tmp_tables" t
WHERE TRUE
  AND t.rn = 1;

-- DROP TABLE IF EXISTS "out_tables_metrics";
CREATE TABLE "out_tables_metrics" AS
SELECT "table_snapshot_id",
       "table_project_id",
       "project_id",
       "table_snapshot_date",
       "table_rows",
       "table_bytes",
       "table_gigabytes",
       "table_terabytes",
       "table_last_import",
       "table_created",
       IFF(rn = 1, TRUE, FALSE) AS "is_last"
FROM "tmp_tables";

-- DROP TABLE IF EXISTS "out_buckets";
CREATE OR REPLACE TABLE "tmp_buckets" AS
SELECT CONCAT_WS('--', "kbc_project_id", "bucket_id")                  AS "bucket_project_id",
       CONCAT_WS('--', "bucket_project_id", "snapshot_date")           AS "bucket_snapshot_id",
       "bucket_id"                                                     AS "bucket_id",
       "kbc_project_id"                                                AS "project_id",
       "snapshot_date"                                                 AS "bucket_snapshot_date",
       "stage"                                                         AS "bucket_stage",
       "sharing_type"                                                  AS "bucket_sharing_type",
       CONCAT_WS('--', "shared_from_project_id", "shared_from_bucket") AS "shared_bucked_project_id",
       REPLACE("bucket", 'c-', '')                                     AS "bucket_name",
       ZEROIFNULL(TRY_TO_NUMBER("rows"))                               AS "bucket_rows",
       ZEROIFNULL(TRY_TO_NUMBER("bytes"))                              AS "bucket_bytes",
       ZEROIFNULL(TRY_TO_NUMBER("bytes")) / POWER(1000, 3)             AS "bucket_gigabytes",
       ZEROIFNULL(TRY_TO_NUMBER("bytes")) / POWER(1000, 4)             AS "bucket_terabytes",
       ROW_NUMBER() OVER (
           PARTITION BY "bucket_project_id"
           ORDER BY "snapshot_date" DESC
           )                                                           AS rn
FROM "kbc_bucket_snapshot" b;

--INNER JOIN "_filter" f ON f."company_id" = b."dst_proj_company";

-- DROP TABLE IF EXISTS "out_buckets";
CREATE TABLE "out_buckets" AS
SELECT DISTINCT b."bucket_project_id",
                b."bucket_id",
                b."project_id",
                b."bucket_name",
                b."bucket_stage",
                b."bucket_sharing_type",
                IFF(b."bucket_sharing_type" = 'none', FALSE, TRUE) AS "is_alias",
                CONCAT(REGION_URL(b."project_id", -1), SPLIT_PART(b."project_id", '-', 1),
                       '/storage-explorer/', b."bucket_id")        AS "bucket_url"
FROM "tmp_buckets" b
WHERE TRUE
  AND b.rn = 1;

CREATE TABLE "out_buckets_metrics" AS
SELECT b."bucket_snapshot_id",
			b."bucket_id",
       b."bucket_project_id",
       b."project_id",
       b."bucket_snapshot_date",
       b."bucket_rows",
       b."bucket_bytes",
       b."bucket_gigabytes",
       b."bucket_terabytes",
       IFF(rn = 1, TRUE, FALSE) AS "is_last"
FROM "tmp_buckets" b;
