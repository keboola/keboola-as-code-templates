--create output table with opportunities
--change timestamps to date
--if there is no amount set, place 0 instead of empty value
--check referential integrity with employees and companies
--change boolean values to commonly used format in KBC scaffolds
CREATE TABLE "out_opportunity"
AS
    SELECT
        "o"."Id"                                    AS "opportunity_id",
        ifnull("c"."company_id", '0')               AS "company_id",
        ifnull("e"."employee_id", '0')              AS "employee_id",
        "o"."Name"                                  AS "opportunity",
        left("o"."CreatedDate", 10)                 AS "date_created",
        "o"."CloseDate"                             AS "date_closed",
        iff("o"."IsClosed" = 'false', 'No', 'Yes')  AS "is_closed",
        iff("o"."IsWon" = 'false', 'No', 'Yes')     AS "is_won",
        'N/A in Salesforce'                         AS "pipeline",
        "o"."StageName"                             AS "stage",
        ifnull("s"."SortOrder", '0')                AS "stage_order",
        "o"."Type"                                  AS "opportunity_type",
        iff("o"."Amount" = '', '0.0', "o"."Amount") AS "opportunity_value",
        "o"."CurrencyIsoCode"                       AS "currency",
        "o"."LeadSource"                            AS "lead_source",
        "o"."Probability"                           AS "probability"
    FROM "opportunity" "o"
             LEFT JOIN "out_company" "c"
                       ON "o"."AccountId" = "c"."company_id"
             LEFT JOIN "out_employee" "e"
                       ON "o"."OwnerId" = "e"."employee_id"
             LEFT JOIN "opportunity_stage" "s"
                       ON "o"."StageName" = "s"."MasterLabel"
    WHERE lower("IsDeleted") = 'false';

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
    ('0', '0', '0', 'Unknown', 'No', 'No', 'N/A in Salesforce', '', '0', '0.0', 'USD');
