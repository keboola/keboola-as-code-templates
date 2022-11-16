--create output activity table
--use only activity related to either contact/lead or opportunity
--format datetime
CREATE OR REPLACE TABLE "out_activity"
AS
    SELECT
        "a"."activity_id"                                                                    AS "activity_id",
        ifnull("e"."employee_id", '0')                                                       AS "employee_id",
        ifnull("c"."contact_id", '0')                                                        AS "contact_id",
        ifnull("o"."opportunity_id", '0')                                                    AS "opportunity_id",
        iff(length("a"."subject") > 1028, left("a"."subject", 1025) || '...', "a"."subject") AS "activity",
        TO_CHAR(TO_TIMESTAMP_NTZ("a"."due_date"),
                'YYYY-MM-DD hh24:mi:ss')                                                     AS "activity_date",
        ''                                                                                   AS "activity_duration_m"
    FROM "activities" "a"
             LEFT JOIN "contact" "c"
                       ON "a"."person_id" = "c"."contact_id"
             LEFT JOIN "opportunity" "o"
                       ON "a"."deal_id" = "o"."opportunity_id"
             LEFT JOIN "employee" "e"
                       ON "a"."user_id" = "e"."employee_id"
    WHERE ("c"."contact_id" IS NOT NULL OR "o"."opportunity_id" IS NOT NULL);
