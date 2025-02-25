/* HS_HUBSPOT."PUBLIC".HS_EMAIL_EVENTS */
CREATE TABLE HS_EMAIL_EVENTS AS
SELECT DISTINCT
  e.`appId` AS APP_ID,
  e.`appName` AS APP_NAME,
  e.`created` AS CREATED,
  e.`emailCampaignId` AS EMAIL_CAMPAIGN_ID,
  e.`id` AS ID,
  e.`portalId` AS PORTAL_ID,
  e.`recipient` AS RECIPIENT,
  e.`type` AS TYPE,
  e.`sentBy_created` AS SENT_BY_CREATED,
  e.`sentBy_id` AS SENT_BY_ID,
  e.`browser_name` AS BROWSER_NAME,
  e.`location_city` AS LOCATION_CITY,
  e.`location_country` AS LOCATION_COUNTRY,
  e.`location_state` AS LOCATION_STATE,
  e.`userAgent` AS USER_AGENT,
  e.`duration` AS DURATION,
  '' AS SOURCE, /* ee."source" */
  '' AS PORTAL_SUBSCRIPTION_STATUS, /* ee."portal_subscription_status" */
  '' AS ATTEMPT, /* ee."attempt" */
  '' AS RESPONSE, /* ee."response" */
  '' AS URL, /* ee."url" */
  '' AS SUBJECT, /* ee."subject" */
  '' AS `FROM`, /* ee."from" */
  '' AS DROP_MESSAGE, /* ee."drop_message" */
  e.`causedBy_id` AS CAUSED_BY_ID
FROM `email_events` AS e
LEFT JOIN `emails` AS ee
  ON 1 = 1