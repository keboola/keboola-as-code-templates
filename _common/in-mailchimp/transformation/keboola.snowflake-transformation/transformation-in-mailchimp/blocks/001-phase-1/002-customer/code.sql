--create output table of customers
--email_address is used as ID
--concatenate first and last name to get full name
CREATE TABLE "customer_out"
AS
SELECT DISTINCT "id"                                                AS "customer_id",
                "email_address"                                     AS "customer_email_address",
                "merge_fields_FNAME" || ' ' || "merge_fields_LNAME" AS "name"
FROM "members";
