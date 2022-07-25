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
FROM "deals_contacts_list" "dc"
         INNER JOIN "out_opportunity" "o"
                    ON "dc"."dealId" = "o"."opportunity_id"
         INNER JOIN "out_contact" "c"
                    ON "dc"."contact_vid" || '_contact' = "c"."contact_id";
