--create output table with contacts
CREATE TABLE "out_contact"
(
    "contact_id" VARCHAR(2000) NOT NULL,
    "contact" VARCHAR(255),
    "email" VARCHAR(255),
    "contact_type" VARCHAR(255),
    "date_created" VARCHAR(255),
    "lead_source" VARCHAR(255),
    "lead_converted" VARCHAR(255)
);


INSERT INTO "out_contact"
    SELECT
        "p"."contact_id"         AS "contact_id",
        "p"."contact_name"       AS "contact",
        "e"."value"              AS "email",
        'Contact'                AS "contact_type",
        "p"."add_time"           AS "date_created",
        ''                       AS "lead_source",
        'Is Contact'             AS "lead_converted"
    FROM "persons" "p"
             LEFT JOIN (SELECT
                            "contact_id",
                            "value"
                        FROM "person_emails"
                        WHERE "primary" = '1') "e"
                       ON "p"."contact_id" = "e"."contact_id";

--fake row to keep referential integrity if child tables are missing existing contact ids
INSERT INTO "out_contact"
    ("contact_id", "contact", "email", "contact_type", "date_created", "lead_source", "lead_converted")
VALUES
    ('0', 'Unknown', '', 'Lead', NULL, '', 'No');
