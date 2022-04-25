-- HS_HUBSPOT."PUBLIC".HS_OWNERS definition
CREATE TABLE HS_OWNERS 
AS
SELECT DISTINCT
    "ownerId" AS ID,
    "email" AS EMAIL,
    "firstName" AS FIRST_NAME,
    "lastName" AS LAST_NAME,
    "userIdIncludingInactive" AS USER_ID,
    CASE WHEN "isActive" = 'True' THEN 'False' ELSE 'True' END AS ARCHIVED
FROM "owners"
;
