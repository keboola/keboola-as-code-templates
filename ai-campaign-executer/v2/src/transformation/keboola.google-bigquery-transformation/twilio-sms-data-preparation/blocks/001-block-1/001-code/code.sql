CREATE TABLE `out_twilio_sms_campaign_ready` AS
SELECT
  `phone` AS `phone_number`,
  `result_value` AS `message`
FROM `twilio_sms_campaign_source_data`;

CREATE TABLE `out_twilio_sms_campaign_approval_request` AS
SELECT
  `phone` AS `phone_number`,
  `result_value` AS `message`,
  FALSE AS `approved`
FROM `twilio_sms_campaign_source_data`;