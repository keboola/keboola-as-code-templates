--create output paring table for opportunities and contacts
--merge both tables ids as paring table id
--use inner joins and ids from referring tables to make sure referential integrity is intact
CREATE TABLE "out_opportunity_contact"
AS
SELECT "o"."opportunity_id" || '-' || "c"."contact_id" AS "opportunity_contact_id",
       "o"."opportunity_id",
       "c"."contact_id",
       ''                                              AS "is_primary_contact",
       ''                                              AS "role"
FROM "deals" "d"
         INNER JOIN "opportunity_ri" "o"
                    ON "d"."deal_id" = "o"."opportunity_id"
         INNER JOIN "contact_ri" "c"
                    ON "d"."person_id" = "c"."contact_id";
