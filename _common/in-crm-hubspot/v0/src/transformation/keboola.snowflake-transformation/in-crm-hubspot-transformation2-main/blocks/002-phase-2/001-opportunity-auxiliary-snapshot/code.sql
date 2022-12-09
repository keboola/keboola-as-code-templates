--create output table with opportunities
--cast timestamps to human-readable date format
--if there is no amount set, place 0 instead of empty value
--opportunities with stage label 'closed won' are marked as won
--check referential integrity with employees and companies
CREATE TABLE "out_opportunity"
AS
    SELECT
        "d"."dealId"                                                             AS "opportunity_id",
        coalesce("c"."company_id", '0')                                          AS "company_id",
        coalesce("e"."employee_id", '0')                                         AS "employee_id",
        "d"."dealname"                                                           AS "opportunity",
        iff("d"."createdate" = '', '', to_date("d"."createdate") :: VARCHAR(10)) AS "date_created",
        iff("d"."closedate" = '', '', to_date("d"."closedate") :: VARCHAR(10))   AS "date_closed",
        iff("d"."closedate" = '', 'No', 'Yes')                                   AS "is_closed",
        iff("s"."closedWon" = 'True', 'Yes', 'No')                               AS "is_won",
        "p"."label"                                                              AS "pipeline",
        "s"."label"                                                              AS "stage",
        "s"."displayOrder"                                                       AS "stage_order",
        "d"."dealtype"                                                           AS "opportunity_type",
        iff("d"."amount" = '', '0', "d"."amount")                                AS "opportunity_value",
        ''                                                                       AS "currency",
        "d"."hs_analytics_source"                                                AS "lead_source",
        "s"."probability"			                                             AS "probability"
    FROM "deals" "d"
             LEFT JOIN "pipelines" "p"
                       ON "d"."pipeline" = "p"."pipelineId"
             LEFT JOIN "stages" "s"
                       ON "d"."dealstage" = "s"."stageId"
             LEFT JOIN "out_employee" "e"
                       ON "d"."hubspot_owner_id" = "e"."employee_id"
             LEFT JOIN "deals_companies" "dc"
                       ON "d"."dealId" = "dc"."dealId"
             LEFT JOIN "out_company" "c"
                       ON "dc"."associated_companyId" = "c"."company_id"
    WHERE lower("d"."isDeleted") = 'false';

--set timezone to UTC (!!!CHANGE ACCORDINGLY TO YOUR REGION!!!)
ALTER
    SESSION
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
    ("opportunity_id", "company_id", "employee_id", "opportunity", "date_created", "date_closed", "is_closed", "is_won",
     "pipeline", "stage", "opportunity_type", "opportunity_value", "currency", "lead_source")
VALUES
    ('0', '0', '0', 'Unknown', '', '', 'No', 'No', '', '', '', '0.0', '', '');
