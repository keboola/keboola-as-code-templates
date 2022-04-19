--create output activity table
--use only activity related to either contact/lead or opportunity
--format datetime
CREATE TABLE "out_activity"
AS
  SELECT
    "a"."Id"                                                      AS "activity_id",
    ifnull("e"."employee_id", '0')                                AS "employee_id",
    ifnull("c"."contact_id", '0')                                 AS "contact_id",
    ifnull("o"."opportunity_id", '0')                             AS "opportunity_id",
    "a"."Subject"                                                 AS "activity",
    replace(split_part("a"."ActivityDateTime", '.', 1), 'T', ' ') AS "activity_date",
    "a"."DurationInMinutes"                                       AS "activity_duration_m"
  FROM "event" "a"
         LEFT JOIN "out_contact" "c"
                   ON "a"."WhoId" = "c"."contact_id"
         LEFT JOIN "out_opportunity" "o"
                   ON "a"."WhatId" = "o"."opportunity_id"
         LEFT JOIN "out_employee" "e"
                   ON "a"."OwnerId" = "e"."employee_id"
  WHERE ("c"."contact_id" IS NOT NULL OR "o"."opportunity_id" IS NOT NULL)
    AND lower("a"."IsDeleted") = 'false';
