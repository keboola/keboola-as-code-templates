-- HS_HUBSPOT."PUBLIC".HS_FORMS
CREATE TABLE HS_FORMS AS
SELECT DISTINCT
"id" AS GUID,
"name" AS NAME,
"configuration__postSubmitAction__type" AS ACTION,
"displayOptions__submitButtonText" AS SUBMIT_TEXT,
'' AS LEAD_NURTURING_CAMPAIGN_ID -- TODO
FROM "forms";
