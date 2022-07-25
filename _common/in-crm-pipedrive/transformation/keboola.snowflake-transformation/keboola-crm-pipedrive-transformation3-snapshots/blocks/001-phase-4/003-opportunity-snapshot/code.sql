--create temporary table for additional calculations
--add previous values of pipeline, stage and value, so we can define if there has been any change
CREATE TABLE "opportunity_snapshot_tmp"
AS
    SELECT
        "opportunity_id",
        "snapshot_date",
        "employee_id",
        "company_id",
        "pipeline",
        ifnull(lag("pipeline") OVER (PARTITION BY "opportunity_id" ORDER BY "snapshot_date"),
               "pipeline")          AS "previous_pipeline",
        "stage",
        "stage_order",
        ifnull(lag("stage") OVER (PARTITION BY "opportunity_id" ORDER BY "snapshot_date"),
               "stage")             AS "previous_stage",
        ifnull(lag("stage_order") OVER (PARTITION BY "opportunity_id" ORDER BY "snapshot_date"),
               "stage_order")       AS "previous_stage_order",
        "opportunity_value",
        ifnull(lag("opportunity_value") OVER (PARTITION BY "opportunity_id" ORDER BY "snapshot_date"),
               "opportunity_value") AS "previous_opportunity_value",
        "probability",
        ifnull(lag("probability") OVER (PARTITION BY "opportunity_id" ORDER BY "snapshot_date"),
               "probability")       AS "previous_probability"
    FROM "opportunity_snapshot";

--create opportunity snapshot table
--define if there has been change of pipeline, stage or value
CREATE TABLE "out_opportunity_snapshot"
AS
    SELECT
        "s"."opportunity_id",
        "s"."snapshot_date",
        "s"."employee_id",
        "s"."company_id",
        "s"."pipeline",
        "s"."previous_pipeline",
        iff("s"."pipeline" <> "s"."previous_pipeline", 'Yes', 'No')                   AS "pipeline_change",
        "s"."stage",
        "s"."stage_order",
        "s"."previous_stage",
        "s"."previous_stage_order",
        iff("s"."stage" <> "s"."previous_stage", 'Yes', 'No')                         AS "stage_change",
        "s"."opportunity_value",
        "s"."previous_opportunity_value",
        iff("s"."opportunity_value" <> "s"."previous_opportunity_value", 'Yes', 'No') AS "opportunity_value_change",
        "s"."probability",
        "s"."previous_probability",
        iff("s"."probability" <> "s"."previous_probability", 'Yes', 'No')             AS "probability_change",
        iff("m"."max_date_in_month" IS NULL, 'false', 'true')                         AS "max_date_in_month"
    FROM "opportunity_snapshot_tmp" "s"
             LEFT JOIN (SELECT
                            "opportunity_id",
                            left("snapshot_date", 7) AS "month",
                            max("snapshot_date")     AS "max_date_in_month"
                        FROM "opportunity_snapshot_tmp"
                        GROUP BY 1, 2) "m"
                       ON "s"."opportunity_id" = "m"."opportunity_id"
                           AND "s"."snapshot_date" = "m"."max_date_in_month";
