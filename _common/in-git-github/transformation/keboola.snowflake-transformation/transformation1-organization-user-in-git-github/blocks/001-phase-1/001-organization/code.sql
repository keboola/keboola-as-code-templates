--create output organization table
CREATE TABLE "out_organization"
AS
    SELECT
        "org_id"   AS "organization_id",
        "org_name" AS "organization"
    FROM "organizations";

--add fake row for referential integrity (users without team)
INSERT INTO "out_organization"
    ("organization_id", "organization")
VALUES
    ('0', 'Unknown');
