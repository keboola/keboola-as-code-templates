--create output table with companies
--cast timestamp to date
CREATE TABLE "out_company"
(
  "company_id" VARCHAR(2000) NOT NULL,
  "company" VARCHAR(255),
  "website" VARCHAR(2000),
  "date_created" DATE
);

INSERT INTO "out_company"
  SELECT DISTINCT
    "Id"                                  AS "company_id",
    "Name"                                AS "company",
    "Website"                             AS "website",
    iff("CreatedDate" = '', null, to_date("CreatedDate")) AS "date_created"
  FROM "account"
  WHERE lower("IsDeleted") = 'false';

--fake row to keep referential integrity if child tables are missing existing company ids
INSERT INTO "out_company"
  ("company_id", "company", "website", "date_created")
VALUES
  ('0', 'Unknown', '', null);
