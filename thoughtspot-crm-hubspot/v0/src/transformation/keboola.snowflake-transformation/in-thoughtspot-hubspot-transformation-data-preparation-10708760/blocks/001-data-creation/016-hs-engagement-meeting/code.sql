-- HS_HUBSPOT."PUBLIC".HS_ENGAGEMENT_MEETING
CREATE TABLE HS_ENGAGEMENT_MEETING 
AS
SELECT DISTINCT
    -- "start_time" 
    '' AS START_TIME,
    -- "end_time" 
    '' AS END_TIME,
    -- "title" 
    '' AS TITLE,
    -- "body"
    '' AS BODY,
    -- "external_url" 
    '' AS EXTERNAL_URL,
    -- "engagement_id" 
    '' AS ENGAGEMENT_ID,
    -- "meeting_outcome" 
    '' AS MEETING_OUTCOME,
    -- "location" 
    '' AS LOCATION
FROM "meetings"
;
