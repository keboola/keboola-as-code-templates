--create output table with campaigns
CREATE TABLE "campaign_out"
AS
SELECT "id"                                     AS "campaign_id",
       "settings_title"                         AS "campaign_title",
       "archive_url"                            AS "campaign_preview_url",
       "type"                                   AS "campaign_type",
       "status"                                 AS "campaign_status",
       "settings_subject_line"                  AS "campaign_subject",
       "settings_from_name"                     AS "campaign_from_name",
       "settings_reply_to"                      AS "campaign_reply_to",
       "emails_sent"                            AS "campaign_emails_sent",
       "recipients_recipient_count"             AS "campaign_recipient_count",
       "report_summary_opens"                   AS "campaign_opens",
       "report_summary_unique_opens"            AS "campaign_unique_opens",
       "report_summary_clicks"                  AS "campaign_clicks",
       "report_summary_subscriber_clicks"       AS "campaign_subscriber_clicks",
       "report_summary_ecommerce_total_orders"  AS "campaign_ecommerce_total_orders",
       "report_summary_ecommerce_total_spent"   AS "campaign_ecommerce_total_spent",
       "report_summary_ecommerce_total_revenue" AS "campaign_ecommerce_total_revenue"
FROM "campaigns";
