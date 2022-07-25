--create output table with companies
--cast timestamp to date
CREATE TABLE "out_company"
AS
  SELECT DISTINCT
    "Id"                                  AS "company_id",
    "Name"                                AS "company",
    "Website"                             AS "website",
    to_date("CreatedDate") :: VARCHAR(10) AS "date_created"
  FROM "account"
  WHERE lower("IsDeleted") = 'false';

--fake row to keep referential integrity if child tables are missing existing company ids
INSERT INTO "out_company"
  ("company_id", "company", "website", "date_created")
VALUES
  ('0', 'Unknown', '', '');
