-- HS_HUBSPOT."PUBLIC".HS_ENGAGEMENT_CALL
CREATE TABLE HS_ENGAGEMENT_CALL 
AS
SELECT DISTINCT
    "body" AS BODY,
    "disposition" AS DISPOSITION,
    "title" AS TITLE,
    "engagement_id" AS ENGAGEMENT_ID
FROM "calls"
;
