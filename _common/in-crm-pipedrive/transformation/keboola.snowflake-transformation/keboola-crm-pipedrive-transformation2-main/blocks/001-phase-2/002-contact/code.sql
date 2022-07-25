--create output table with contacts
CREATE TABLE "out_contact"
AS
    SELECT
        "p"."contact_id"         AS "contact_id",
        "p"."contact_name"       AS "contact",
        "e"."value"              AS "email",
        'Contact'                AS "contact_type",
        left("p"."add_time", 10) AS "date_created",
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
    ('0', 'Unknown', '', 'Lead', '', '', 'No');
