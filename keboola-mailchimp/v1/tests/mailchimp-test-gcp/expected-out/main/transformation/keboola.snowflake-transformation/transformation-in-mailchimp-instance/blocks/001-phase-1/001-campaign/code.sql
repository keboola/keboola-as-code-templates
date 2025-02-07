--create output table with campaigns
CREATE TABLE "campaign_out"
(
    "campaign_id" VARCHAR(255) NOT NULL,
    "campaign_title" VARCHAR(255),
    "campaign_preview_url" VARCHAR(1024),
    "campaign_type" VARCHAR(255),
    "campaign_status" VARCHAR(255),
    "campaign_subject" VARCHAR(255),
    "campaign_from_name" VARCHAR(255),
    "campaign_reply_to" VARCHAR(255),
    "campaign_emails_sent" INTEGER,
    "campaign_recipient_count" INTEGER,
    "campaign_opens" INTEGER,
    "campaign_unique_opens" INTEGER,
    "campaign_clicks" INTEGER,
    "campaign_subscriber_clicks" INTEGER,
    "campaign_ecommerce_total_orders" INTEGER,
    "campaign_ecommerce_total_spent" INTEGER,
    "campaign_ecommerce_total_revenue" INTEGER
);

INSERT INTO "campaign_out"
SELECT "id"                                     AS "campaign_id",
       "settings_title"                         AS "campaign_title",
       "archive_url"                            AS "campaign_preview_url",
       "type"                                   AS "campaign_type",
       "status"                                 AS "campaign_status",
       "settings_subject_line"                  AS "campaign_subject",
       "settings_from_name"                     AS "campaign_from_name",
       "settings_reply_to"                      AS "campaign_reply_to",
       nullif("emails_sent",'')                            AS "campaign_emails_sent",
       nullif("recipients_recipient_count",'')             AS "campaign_recipient_count",
       nullif("report_summary_opens",'')                   AS "campaign_opens",
       nullif("report_summary_unique_opens",'')            AS "campaign_unique_opens",
       nullif("report_summary_clicks",'')                  AS "campaign_clicks",
       nullif("report_summary_subscriber_clicks",'')       AS "campaign_subscriber_clicks",
       nullif("report_summary_ecommerce_total_orders",'')  AS "campaign_ecommerce_total_orders",
       nullif("report_summary_ecommerce_total_spent",'')   AS "campaign_ecommerce_total_spent",
       nullif("report_summary_ecommerce_total_revenue",'') AS "campaign_ecommerce_total_revenue"
FROM "campaigns";
