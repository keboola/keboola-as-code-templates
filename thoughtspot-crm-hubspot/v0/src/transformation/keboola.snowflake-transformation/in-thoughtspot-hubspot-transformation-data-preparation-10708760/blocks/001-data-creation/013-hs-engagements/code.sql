-- HS_HUBSPOT."PUBLIC".HS_ENGAGEMENTS 
CREATE TABLE HS_ENGAGEMENTS 
AS
SELECT DISTINCT
    "engagement_id" AS ID,
    "engagement_createdAt" AS CREATED_AT,
    "engagement_createdBy" CREATED_BY
FROM "activities"
;
