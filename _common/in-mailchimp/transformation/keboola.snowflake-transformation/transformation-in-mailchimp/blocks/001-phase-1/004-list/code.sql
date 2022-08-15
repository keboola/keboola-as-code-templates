--create output table of lists
CREATE TABLE "lists_out"
AS
SELECT "id"              AS "list_id",
       "name"            AS "list_name",
       "contact_company" AS "list_contact_company",
       "contact_country" AS "list_contact_country",
       "list_rating"     AS "list_rating"
FROM "lists";
