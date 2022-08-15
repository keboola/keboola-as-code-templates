{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-mailchimp-bdm-" + InstanceIdShort() + ".campaign_event",
          destination: "out.c-mailchimp-bdm-" + InstanceIdShort() + ".campaign_event.csv",
          changed_since: "adaptive",
          columns: [
            "campaign_event_id",
            "campaign_id",
            "list_id",
            "campaign_event_type",
            "campaign_event_date",
          ],
        },
      ],
    },
  },
  parameters: {
    tables: [
      {
        dbName: "campaign_event",
        tableId: "out.c-mailchimp-bdm-" + InstanceIdShort() + ".campaign_event",
        incremental: true,
        items: [
          {
            name: "campaign_event_id",
            dbName: "campaign_event_id",
            type: "STRING",
          },
          {
            name: "campaign_id",
            dbName: "campaign_id",
            type: "STRING",
          },
          {
            name: "list_id",
            dbName: "list_id",
            type: "STRING",
          },
          {
            name: "campaign_event_type",
            dbName: "campaign_event_type",
            type: "STRING",
          },
          {
            name: "campaign_event_date",
            dbName: "campaign_event_date",
            type: "STRING",
          },
        ],
      },
    ],
  },
}
