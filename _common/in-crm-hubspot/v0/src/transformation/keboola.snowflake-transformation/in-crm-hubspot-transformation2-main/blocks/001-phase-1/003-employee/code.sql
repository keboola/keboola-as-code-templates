--create output table with employees
--concatenate first and last name to get full name of the employee
CREATE TABLE "out_employee"
(
    "employee_id" VARCHAR(2000) NOT NULL,
    "employee" VARCHAR(255),
    "email" VARCHAR(255),
    "position" VARCHAR(255)
);

INSERT INTO "out_employee"
SELECT "ownerId"                        AS "employee_id",
       "firstName" || ' ' || "lastName" AS "employee",
       "email",
       ''                               AS "position"
FROM "owners";

--fake row to keep referential integrity if child tables are missing existing employee ids
INSERT INTO "out_employee"
    ("employee_id", "employee", "email", "position")
VALUES ('0', 'Unknown', '', '');
