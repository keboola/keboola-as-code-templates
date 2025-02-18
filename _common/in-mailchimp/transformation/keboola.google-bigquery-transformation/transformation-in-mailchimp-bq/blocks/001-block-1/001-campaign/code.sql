--create output table with campaigns
CREATE TABLE `campaign_out`
(
    campaign_id STRING NOT NULL,
    campaign_title STRING,
    campaign_preview_url STRING,
    campaign_type STRING,
    campaign_status STRING,
    campaign_subject STRING,
    campaign_from_name STRING,
    campaign_reply_to STRING,
    campaign_emails_sent INT64,
    campaign_recipient_count INT64,
    campaign_opens INT64,
    campaign_unique_opens INT64,
    campaign_clicks INT64,
    campaign_subscriber_clicks INT64,
    campaign_ecommerce_total_orders INT64,
    campaign_ecommerce_total_spent INT64,
    campaign_ecommerce_total_revenue INT64
);

INSERT INTO `campaign_out`
SELECT id                                       													AS campaign_id,
       settings_title                       															AS campaign_title,
       archive_url                          															AS campaign_preview_url,
       type                                   														AS campaign_type,
       status                                 														AS campaign_status,
       settings_subject_line                  														AS campaign_subject,
       settings_from_name                     														AS campaign_from_name,
       settings_reply_to                      														AS campaign_reply_to,
       CAST(nullif(emails_sent,'') AS INT64)                							AS campaign_emails_sent,
       CAST(nullif(recipients_recipient_count,'') AS INT64)     					AS campaign_recipient_count,
       CAST(nullif(report_summary_opens,'') AS INT64)           					AS campaign_opens,
       CAST(nullif(report_summary_unique_opens,'')  AS INT64)   					AS campaign_unique_opens,
       CAST(nullif(report_summary_clicks,'') AS INT64)              			AS campaign_clicks,
       CAST(nullif(report_summary_subscriber_clicks,'') AS INT64)      		AS campaign_subscriber_clicks,
       CAST(nullif(report_summary_ecommerce_total_orders,'') AS INT64)  	AS campaign_ecommerce_total_orders,
       CAST(nullif(report_summary_ecommerce_total_spent,'') AS INT64)   	AS campaign_ecommerce_total_spent,
       CAST(nullif(report_summary_ecommerce_total_revenue,'') AS INT64) 	AS campaign_ecommerce_total_revenue
FROM `campaigns`;
