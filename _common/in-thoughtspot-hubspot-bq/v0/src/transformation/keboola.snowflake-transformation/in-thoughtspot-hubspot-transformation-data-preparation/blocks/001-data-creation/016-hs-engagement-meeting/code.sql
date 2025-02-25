/* HS_HUBSPOT."PUBLIC".HS_ENGAGEMENT_MEETING */
CREATE TABLE HS_ENGAGEMENT_MEETING AS
SELECT DISTINCT
  '' AS START_TIME, /* "start_time" */
  '' AS END_TIME, /* "end_time" */
  '' AS TITLE, /* "title" */
  '' AS BODY, /* "body" */
  '' AS EXTERNAL_URL, /* "external_url" */
  '' AS ENGAGEMENT_ID, /* "engagement_id" */
  '' AS MEETING_OUTCOME, /* "meeting_outcome" */
  '' AS LOCATION /* "location" */
FROM `meetings`