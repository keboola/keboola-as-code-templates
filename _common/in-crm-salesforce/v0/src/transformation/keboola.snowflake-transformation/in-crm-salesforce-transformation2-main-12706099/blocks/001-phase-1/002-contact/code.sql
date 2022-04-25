--create output table with contacts
CREATE TABLE "out_contact"
AS
  SELECT
    "Id"                                  AS "contact_id",
    "Name"                                AS "contact",
    "Email"                               AS "email",
    'Contact'                             AS "contact_type",
    to_date("CreatedDate") :: VARCHAR(10) AS "date_created",
    "LeadSource"                          AS "lead_source",
    'Is Contact'                          AS "lead_converted"
  FROM "contact"
  WHERE lower("IsDeleted") = 'false'
  UNION ALL
  --insert leads and mark if they are already converted
  SELECT
    "Id"                                      AS "contact_id",
    "Name"                                    AS "contact",
    "Email"                                   AS "email",
    'Lead'                                    AS "contact_type",
    to_date("CreatedDate") :: VARCHAR(10)     AS "date_created",
    "LeadSource"                              AS "lead_source",
    iff("IsConverted" = 'false', 'No', 'Yes') AS "lead_converted"
  FROM "lead"
  WHERE lower("IsDeleted") = 'false';

--fake row to keep referential integrity if child tables are missing existing contact ids
INSERT INTO "out_contact"
  ("contact_id", "contact", "email", "contact_type", "date_created", "lead_source", "lead_converted")
VALUES
  ('0', 'Unknown', '', 'Lead', '', '', 'No');
