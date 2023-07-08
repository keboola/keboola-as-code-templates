--create output table with leads and contacts
--concatenate first and last name to get full name
--leads are identified as contacts/converted if they have and associatedcompanyid filled
CREATE TABLE "out_contact"
(
    "contact_id" VARCHAR(2000) NOT NULL,
    "contact" VARCHAR(255),
    "email" VARCHAR(255),
    "contact_type" VARCHAR(255),
    "date_created" DATE,
    "lead_source" VARCHAR(255),
    "lead_converted" VARCHAR(255)
);

INSERT INTO "out_contact"
SELECT "canonical_vid" || '_contact'                                    AS "contact_id",
       "firstname" || ' ' || "lastname"                                 AS "contact",
       "email"                                                          AS "email",
       'Contact'                                                        AS "contact_type",
       nullif(to_char("createdate"),'')                                 AS "date_created",
       "email_source"                                                   AS "lead_source",
       'Is Contact'                                                     AS "lead_converted"
FROM "contacts"
WHERE "associatedcompanyid" != ''
UNION ALL
--insert leads and mark if they are already converted ("associatedcompanyid" != '')
SELECT "canonical_vid" || '_lead'                                       AS "contact_id",
       "firstname" || ' ' || "lastname"                                 AS "contact",
       "email"                                                          AS "email",
       'Lead'                                                           AS "contact_type",
       nullif(to_char("createdate"),'')                                 AS "date_created",
       "email_source"                                                   AS "lead_source",
       iff("associatedcompanyid" != '', 'Yes', 'No')                    AS "lead_converted"
FROM "contacts";

--fake row to keep referential integrity if child tables are missing existing contact ids
INSERT INTO "out_contact"
("contact_id", "contact", "email", "contact_type", "date_created", "lead_source", "lead_converted")
VALUES ('0', 'Unknown', '', 'Lead', null, '', 'No');
