/* create output table with campaigns */
CREATE TABLE `campaign_out` (
  `campaign_id` STRING(255) NOT NULL,
  `campaign_title` STRING(255),
  `campaign_preview_url` STRING(1024),
  `campaign_type` STRING(255),
  `campaign_status` STRING(255),
  `campaign_subject` STRING(255),
  `campaign_from_name` STRING(255),
  `campaign_reply_to` STRING(255),
  `campaign_emails_sent` INT64,
  `campaign_recipient_count` INT64,
  `campaign_opens` INT64,
  `campaign_unique_opens` INT64,
  `campaign_clicks` INT64,
  `campaign_subscriber_clicks` INT64,
  `campaign_ecommerce_total_orders` INT64,
  `campaign_ecommerce_total_spent` INT64,
  `campaign_ecommerce_total_revenue` INT64
)
INSERT INTO `campaign_out`
SELECT
  `id` AS `campaign_id`,
  `settings_title` AS `campaign_title`,
  `archive_url` AS `campaign_preview_url`,
  `type` AS `campaign_type`,
  `status` AS `campaign_status`,
  `settings_subject_line` AS `campaign_subject`,
  `settings_from_name` AS `campaign_from_name`,
  `settings_reply_to` AS `campaign_reply_to`,
  NULLIF(`emails_sent`, '') AS `campaign_emails_sent`,
  NULLIF(`recipients_recipient_count`, '') AS `campaign_recipient_count`,
  NULLIF(`report_summary_opens`, '') AS `campaign_opens`,
  NULLIF(`report_summary_unique_opens`, '') AS `campaign_unique_opens`,
  NULLIF(`report_summary_clicks`, '') AS `campaign_clicks`,
  NULLIF(`report_summary_subscriber_clicks`, '') AS `campaign_subscriber_clicks`,
  NULLIF(`report_summary_ecommerce_total_orders`, '') AS `campaign_ecommerce_total_orders`,
  NULLIF(`report_summary_ecommerce_total_spent`, '') AS `campaign_ecommerce_total_spent`,
  NULLIF(`report_summary_ecommerce_total_revenue`, '') AS `campaign_ecommerce_total_revenue`
FROM `campaigns`