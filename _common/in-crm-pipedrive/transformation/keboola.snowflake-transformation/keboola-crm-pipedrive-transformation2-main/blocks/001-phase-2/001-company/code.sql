--create output table with companies
CREATE TABLE "out_company"
(
    "company_id" VARCHAR(2000) NOT NULL,
    "company" VARCHAR(255),
    "website" VARCHAR(255),
    "date_created" DATE
);
--cast timestamp to date
INSERT INTO "out_company"
SELECT DISTINCT "organization_id"                                                     AS "company_id",
                "org_name"                                                            AS "company",
                ''                                                                    AS "website",
                iff("org_add_date" = '', NULL, to_date("org_add_date")):: VARCHAR(10) AS "date_created"
FROM "organizations";

--fake row to keep referential integrity if child tables are missing existing company ids
INSERT INTO "out_company"
    ("company_id", "company", "website", "date_created")
VALUES ('0', 'Unknown', '', NULL);
