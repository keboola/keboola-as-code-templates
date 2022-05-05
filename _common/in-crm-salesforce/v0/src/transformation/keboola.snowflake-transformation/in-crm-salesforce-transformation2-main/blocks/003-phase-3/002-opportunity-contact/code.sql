--create output paring table for opportunities and contacts
--merge both tables ids as paring table id
--use inner joins and ids from referring tables to make sure referential integrity is intact
--change boolean values to commonly used format in KBC scaffolds
CREATE TABLE "out_opportunity_contact"
AS
  SELECT
    "o"."opportunity_id" || '-' || "c"."contact_id" AS "opportunity_contact_id",
    "o"."opportunity_id",
    "c"."contact_id",
    iff("r"."IsPrimary" = 'false', 'No', 'Yes')     AS "is_primary_contact",
    "r"."Role"                                      AS "role"
  FROM "opportunity_contact_role" "r"
         INNER JOIN "out_opportunity" "o"
                    ON "r"."OpportunityId" = "o"."opportunity_id"
         INNER JOIN "out_contact" "c"
                    ON "r"."ContactId" = "c"."contact_id"
  WHERE lower("r"."IsDeleted") = 'false';
