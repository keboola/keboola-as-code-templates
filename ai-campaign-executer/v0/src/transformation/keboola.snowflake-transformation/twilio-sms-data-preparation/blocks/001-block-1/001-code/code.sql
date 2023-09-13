CREATE TABLE "out_twilio_sms_campaign_ready" AS
SELECT 
    "phone" AS "phone_number",
    "result_value" AS "message"
FROM "twilio_sms_campaing_source_data";

CREATE TABLE  "out_twilio_sms_campaign_approval_request" AS
SELECT 
    "phone" AS "phone_number",
    "result_value" AS "message",
    false AS "approved"
FROM "twilio_sms_campaing_source_data";
