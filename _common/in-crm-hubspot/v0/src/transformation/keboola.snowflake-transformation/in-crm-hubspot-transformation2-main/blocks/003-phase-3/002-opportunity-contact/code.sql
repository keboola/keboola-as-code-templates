--create output paring table for opportunities and contacts
--merge both tables ids as paring table id
--use inner joins and ids from referring tables to make sure referential integrity is intact
CREATE TABLE "out_opportunity_contact"
(
    "opportunity_contact_id" VARCHAR(2000) NOT NULL,
    "opportunity_id" VARCHAR(2000),
    "contact_id" VARCHAR(2000),
    "is_primary_contact" VARCHAR(255),
    "role" VARCHAR(255)
);

INSERT INTO "out_opportunity_contact"
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
