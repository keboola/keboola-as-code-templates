--create output table with companies
--cast timestamp to date
CREATE TABLE "out_company"
(
    "company_id" VARCHAR(2000) NOT NULL,
    "company" VARCHAR(255),
    "website" VARCHAR(255),
    "date_created" DATE
);

INSERT INTO "out_company"
SELECT DISTINCT "companyId"                          AS "company_id",
                "name"                               AS "company",
                "website"                            AS "website",
                nullif(to_char("createdate"),'')     AS "date_created"
FROM "companies"
WHERE lower("isDeleted") = 'false';

--fake row to keep referential integrity if child tables are missing existing company ids
INSERT INTO "out_company"
    ("company_id", "company", "website", "date_created")
VALUES ('0', 'Unknown', '', null);
