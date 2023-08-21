{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-mailchimp-bdm-" + InstanceIdShort() + ".campaign",
          destination: "out.c-mailchimp-bdm-" + InstanceIdShort() + ".campaign.csv",
          changed_since: "adaptive",
          columns: [
            "campaign_id",
            "campaign_title",
            "campaign_preview_url",
            "campaign_type",
            "campaign_status",
            "campaign_subject",
            "campaign_from_name",
            "campaign_reply_to",
            "campaign_emails_sent",
            "campaign_recipient_count",
            "campaign_opens",
            "campaign_unique_opens",
            "campaign_clicks",
            "campaign_subscriber_clicks",
            "campaign_ecommerce_total_orders",
            "campaign_ecommerce_total_spent",
            "campaign_ecommerce_total_revenue",
          ],
        },
      ],
    },
  },
  parameters: {
    tables: [
      {
        dbName: "campaign",
        tableId: "out.c-mailchimp-bdm-" + InstanceIdShort() + ".campaign",
        incremental: true,
        items: [
          {
            name: "campaign_id",
            dbName: "campaign_id",
            type: "STRING",
          },
          {
            name: "campaign_title",
            dbName: "campaign_title",
            type: "STRING",
          },
          {
            name: "campaign_preview_url",
            dbName: "campaign_preview_url",
            type: "STRING",
          },
          {
            name: "campaign_type",
            dbName: "campaign_type",
            type: "STRING",
          },
          {
            name: "campaign_status",
            dbName: "campaign_status",
            type: "STRING",
          },
          {
            name: "campaign_subject",
            dbName: "campaign_subject",
            type: "STRING",
          },
          {
            name: "campaign_from_name",
            dbName: "campaign_from_name",
            type: "STRING",
          },
          {
            name: "campaign_reply_to",
            dbName: "campaign_reply_to",
            type: "STRING",
          },
          {
            name: "campaign_emails_sent",
            dbName: "campaign_emails_sent",
            type: "STRING",
          },
          {
            name: "campaign_recipient_count",
            dbName: "campaign_recipient_count",
            type: "STRING",
          },
          {
            name: "campaign_opens",
            dbName: "campaign_opens",
            type: "STRING",
          },
          {
            name: "campaign_unique_opens",
            dbName: "campaign_unique_opens",
            type: "STRING",
          },
          {
            name: "campaign_clicks",
            dbName: "campaign_clicks",
            type: "STRING",
          },
          {
            name: "campaign_subscriber_clicks",
            dbName: "campaign_subscriber_clicks",
            type: "STRING",
          },
          {
            name: "campaign_ecommerce_total_orders",
            dbName: "campaign_ecommerce_total_orders",
            type: "STRING",
          },
          {
            name: "campaign_ecommerce_total_spent",
            dbName: "campaign_ecommerce_total_spent",
            type: "STRING",
          },
          {
            name: "campaign_ecommerce_total_revenue",
            dbName: "campaign_ecommerce_total_revenue",
            type: "STRING",
          },
        ],
      },
    ],
  },
}
