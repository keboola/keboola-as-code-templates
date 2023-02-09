{
  parameters: {
    tableId: "out.c-mailchimp-bdm-" + InstanceIdShort() + ".campaign_event",
    dbName: "campaign_event",
    incremental: true,
    primaryKey: [
      "campaign_event_id",
    ],
    items: [
      {
        name: "campaign_event_id",
        dbName: "campaign_event_id",
        type: "varchar",
        nullable: false,
        default: "",
        size: "16777216",
      },
      {
        name: "campaign_id",
        dbName: "campaign_id",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
      {
        name: "list_id",
        dbName: "list_id",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
      {
        name: "campaign_event_type",
        dbName: "campaign_event_type",
        type: "varchar",
        nullable: true,
        default: "",
        size: "7",
      },
      {
        name: "campaign_event_date",
        dbName: "campaign_event_date",
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
          source: "out.c-mailchimp-bdm-" + InstanceIdShort() + ".campaign_event",
          destination: "out.c-mailchimp-bdm-" + InstanceIdShort() + ".campaign_event.csv",
          columns: [
            "campaign_event_id",
            "campaign_id",
            "list_id",
            "campaign_event_type",
            "campaign_event_date",
          ],
          changed_since: "adaptive",
        },
      ],
    },
  },
}
