-- HS_HUBSPOT."PUBLIC".HS_ENGAGEMENT_EMAIL
CREATE TABLE HS_ENGAGEMENT_EMAIL 
AS
SELECT DISTINCT
    -- "html" 
    ''AS HTML,
    -- "engagement_id" 
    '' AS ENGAGEMENT_ID,
    -- "from_email" 
    ''AS FROM_EMAIL,
    --"sender_email" 
    '' AS SENDER_EMAIL,
    -- "subject" 
    '' AS SUBJECT,
    -- "text" 
    ''AS TEXT,
    -- "status" 
    ''AS STATUS,
    -- "from_first_name" 
    ''AS FROM_FIRST_NAME,
    -- "from_last_name" 
    ''AS FROM_LAST_NAME
FROM "emails"
;
