--create output activity table
--use only activity related to either contact/lead or opportunity
--format datetime
--convert duration to minutes
--using the first contact/opportunity/employee ID in array from activities table for joins
CREATE TABLE "out_activity"
(
    "activity_id" VARCHAR(2000) NOT NULL,
    "employee_id" VARCHAR(2000),
    "contact_id" VARCHAR(2000),
    "opportunity_id" VARCHAR(2000),
    "activity" VARCHAR(2000),
    "activity_date" TIMESTAMP,
    "activity_duration_m" FLOAT
);

INSERT INTO "out_activity"
SELECT "a"."engagement_id"                              AS "activity_id",
       ifnull("e"."employee_id", '0')                   AS "employee_id",
       ifnull("c"."contact_id", '0')                    AS "contact_id",
       ifnull("o"."opportunity_id", '0')                AS "opportunity_id",
       iff(length("a"."metadata_subject") > 1028, left("a"."metadata_subject", 1025) || '...', "a"."metadata_subject")		                          AS "activity",
       to_timestamp_ntz("a"."engagement_createdAt")     AS "activity_date",
       (iff("a"."metadata_durationMilliseconds" = '', NULL,
           "a"."metadata_durationMilliseconds" / 60000))::FLOAT  AS "activity_duration_m"
FROM "activities" "a"
         LEFT JOIN "out_contact" "c"
                   ON SPLIT_PART(REPLACE(REPLACE("a"."associations_contactIds", ']', ''), '[', ''), ',', 0) ||
                      '_contact' = "c"."contact_id"
         LEFT JOIN "out_opportunity" "o"
                   ON SPLIT_PART(REPLACE(REPLACE("a"."associations_dealIds", ']', ''), '[', ''), ',', 0) =
                      "o"."opportunity_id"
         LEFT JOIN "out_employee" "e"
                   ON SPLIT_PART(REPLACE(REPLACE("a"."associations_ownerIds", ']', ''), '[', ''), ',', 0) =
                      "e"."employee_id"
WHERE ("c"."contact_id" IS NOT NULL OR "o"."opportunity_id" IS NOT NULL)
;