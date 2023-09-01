{
  parameters: {
    tableId: "out.c-mailchimp-bdm-" + InstanceIdShort() + ".campaign",
    dbName: "campaign",
    incremental: true,
    primaryKey: [
      "campaign_id",
    ],
    items: [
      {
        name: "campaign_id",
        dbName: "campaign_id",
        type: "varchar",
        nullable: false,
        default: "",
        size: "16777216",
      },
      {
        name: "campaign_title",
        dbName: "campaign_title",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
      {
        name: "campaign_preview_url",
        dbName: "campaign_preview_url",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
      {
        name: "campaign_type",
        dbName: "campaign_type",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
      {
        name: "campaign_status",
        dbName: "campaign_status",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
      {
        name: "campaign_subject",
        dbName: "campaign_subject",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
      {
        name: "campaign_from_name",
        dbName: "campaign_from_name",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
      {
        name: "campaign_reply_to",
        dbName: "campaign_reply_to",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
      {
        name: "campaign_emails_sent",
        dbName: "campaign_emails_sent",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
      {
        name: "campaign_recipient_count",
        dbName: "campaign_recipient_count",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
      {
        name: "campaign_opens",
        dbName: "campaign_opens",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
      {
        name: "campaign_unique_opens",
        dbName: "campaign_unique_opens",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
      {
        name: "campaign_clicks",
        dbName: "campaign_clicks",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
      {
        name: "campaign_subscriber_clicks",
        dbName: "campaign_subscriber_clicks",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
      {
        name: "campaign_ecommerce_total_orders",
        dbName: "campaign_ecommerce_total_orders",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
      {
        name: "campaign_ecommerce_total_spent",
        dbName: "campaign_ecommerce_total_spent",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
      {
        name: "campaign_ecommerce_total_revenue",
        dbName: "campaign_ecommerce_total_revenue",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
    ],
  },
  storage: {
    input: {
      tables: [
        {
          source: "out.c-mailchimp-bdm-" + InstanceIdShort() + ".campaign",
          destination: "out.c-mailchimp-bdm-" + InstanceIdShort() + ".campaign.csv",
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
          changed_since: "adaptive",
        },
      ],
    },
  },
}
