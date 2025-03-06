/* HS_HUBSPOT."PUBLIC".HS_ENGAGEMENT_EMAIL */
CREATE TABLE HS_ENGAGEMENT_EMAIL AS
SELECT DISTINCT
  '' AS HTML, /* "html" */
  '' AS ENGAGEMENT_ID, /* "engagement_id" */
  '' AS FROM_EMAIL, /* "from_email" */
  '' AS SENDER_EMAIL, /* "sender_email" */
  '' AS SUBJECT, /* "subject" */
  '' AS TEXT, /* "text" */
  '' AS STATUS, /* "status" */
  '' AS FROM_FIRST_NAME, /* "from_first_name" */
  '' AS FROM_LAST_NAME /* "from_last_name" */
FROM `emails`