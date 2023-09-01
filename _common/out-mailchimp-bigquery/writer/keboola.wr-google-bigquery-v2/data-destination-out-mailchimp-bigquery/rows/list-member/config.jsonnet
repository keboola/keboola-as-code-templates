{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-mailchimp-bdm-" + InstanceIdShort() + ".list_member",
          destination: "out.c-mailchimp-bdm-" + InstanceIdShort() + ".list_member.csv",
          changed_since: "adaptive",
          columns: [
            "list_member_id",
            "customer_id",
            "list_id",
            "list_member_status",
            "list_member_source",
            "list_member_unsubscribe_reason",
            "list_member_rating",
            "list_member_avg_open_rate",
            "list_member_avg_click_rate",
          ],
        },
      ],
    },
  },
  parameters: {
    tables: [
      {
        dbName: "list_member",
        tableId: "out.c-mailchimp-bdm-" + InstanceIdShort() + ".list_member",
        incremental: true,
        items: [
          {
            name: "list_member_id",
            dbName: "list_member_id",
            type: "STRING",
          },
          {
            name: "customer_id",
            dbName: "customer_id",
            type: "STRING",
          },
          {
            name: "list_id",
            dbName: "list_id",
            type: "STRING",
          },
          {
            name: "list_member_status",
            dbName: "list_member_status",
            type: "STRING",
          },
          {
            name: "list_member_source",
            dbName: "list_member_source",
            type: "STRING",
          },
          {
            name: "list_member_unsubscribe_reason",
            dbName: "list_member_unsubscribe_reason",
            type: "STRING",
          },
          {
            name: "list_member_rating",
            dbName: "list_member_rating",
            type: "STRING",
          },
          {
            name: "list_member_avg_open_rate",
            dbName: "list_member_avg_open_rate",
            type: "STRING",
          },
          {
            name: "list_member_avg_click_rate",
            dbName: "list_member_avg_click_rate",
            type: "STRING",
          },
        ],
      },
    ],
  },
}
