--create output table with opportunities
--change timestamps to date
--if there is no amount set, place 0 instead of empty value
--check referential integrity with employees and companies
--change boolean values to commonly used format in KBC scaffolds
CREATE TABLE "out_opportunity"
AS
    SELECT
        "d"."deal_id"                                       AS "opportunity_id",
        ifnull("c"."company_id", '0')                       AS "company_id",
        ifnull("e"."employee_id", '0')                      AS "employee_id",
        "d"."deal_title"                                    AS "opportunity",
        left("d"."add_time", 10)                            AS "date_created",
        left("d"."close_time", 10)                          AS "date_closed",
        iff("d"."close_time" = '', 'No', 'Yes')             AS "is_closed",
        iff("d"."deal_status" = 'won', 'Yes', 'No')         AS "is_won",
        "p"."pipeline_name"                                 AS "pipeline",
        "s"."stage_name"                                    AS "stage",
        ifnull("s"."order_nr", '0')                         AS "stage_order",
        ''                                                  AS "opportunity_type",
        iff("d"."deal_value" = '', '0.0', "d"."deal_value") AS "opportunity_value",
        "d"."deal_currency"                                 AS "currency",
        ''                                                  AS "lead_source",
        "s"."deal_probability"                              AS "probability"
    FROM "deals" "d"
             LEFT JOIN "out_company" "c"
                       ON "d"."org_id" = "c"."company_id"
             LEFT JOIN "pipelines" "p"
                       ON "d"."pipeline_id" = "p"."pipeline_id"
             LEFT JOIN "stages" "s"
                       ON "d"."stage_id" = "s"."stage_id"
             LEFT JOIN "out_employee" "e"
                       ON "d"."owner_id" = "e"."employee_id"
    WHERE "deal_deleted" = '';

--set timezone to UTC (!!!CHANGE ACCORDINGLY TO YOUR REGION!!!)
ALTER SESSION
    SET TIMEZONE = 'UTC';

--create snapshot of the output table to track changes throughout time
--snapshot will be used in another transformation where it will be adjusted for a better final analysis
CREATE TABLE "out_opportunity_snapshot"
AS
    SELECT
        current_date AS "snapshot_date",
        "o".*
    FROM "out_opportunity" "o";

--fake row to keep referential integrity if child tables are missing existing opportunity ids
--adding row after snapshot, so we're not unnecessary snapshoting it
INSERT INTO "out_opportunity"
    ("opportunity_id", "company_id", "employee_id", "opportunity", "is_closed", "is_won",
     "pipeline", "stage", "stage_order", "opportunity_value", "currency")
VALUES
    ('0', '0', '0', 'Unknown', 'No', 'No', '', '', '0', '0.0', 'USD');
