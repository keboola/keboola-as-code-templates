--create output table with companies
--cast timestamp to date
CREATE TABLE "out_company"
AS
SELECT DISTINCT "companyId"                          AS "company_id",
                "name"                               AS "company",
                "website"                            AS "website",
                to_date("createdate") :: VARCHAR(10) AS "date_created"
FROM "companies"
WHERE lower("isDeleted") = 'false';

--fake row to keep referential integrity if child tables are missing existing company ids
INSERT INTO "out_company"
    ("company_id", "company", "website", "date_created")
VALUES ('0', 'Unknown', '', '');
