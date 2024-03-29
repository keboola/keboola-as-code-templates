{
  parameters: {
    tableId: "out.c-mailchimp-bdm-" + InstanceIdShort() + ".list_member",
    dbName: "list_member",
    incremental: false,
    primaryKey: [
      "list_member_id",
    ],
    items: [
      {
          name: "list_member_id",
          dbName: "list_member_id",
          type: "varchar",
          nullable: false,
          default: "",
          size: "10485760"
      },
      {
          name: "customer_id",
          dbName: "customer_id",
          type: "varchar",
          nullable: true,
          default: "",
          size: "10485760"
      },
      {
          name: "list_id",
          dbName: "list_id",
          type: "varchar",
          nullable: true,
          default: "",
          size: "10485760"
      },
      {
          name: "list_member_status",
          dbName: "list_member_status",
          type: "varchar",
          nullable: true,
          default: "",
          size: "10485760"
      },
      {
          name: "list_member_source",
          dbName: "list_member_source",
          type: "varchar",
          nullable: true,
          default: "",
          size: "10485760"
      },
      {
          name: "list_member_unsubscribe_reason",
          dbName: "list_member_unsubscribe_reason",
          type: "varchar",
          nullable: true,
          default: "",
          size: "10485760"
      },
      {
          name: "list_member_rating",
          dbName: "list_member_rating",
          type: "integer",
          nullable: true,
          default: "",
          size: ""
      },
      {
          name: "list_member_avg_open_rate",
          dbName: "list_member_avg_open_rate",
          type: "integer",
          nullable: true,
          default: "",
          size: ""
      },
      {
          name: "list_member_avg_click_rate",
          dbName: "list_member_avg_click_rate",
          type: "integer",
          nullable: true,
          default: "",
          size: ""
      }
    ],
  },
  storage: {
    input: {
      tables: [
        {
          source: "out.c-mailchimp-bdm-" + InstanceIdShort() + ".list_member",
          destination: "out.c-mailchimp-bdm-" + InstanceIdShort() + ".list_member.csv",
          columns: [
            "list_member_id",
            "customer_id",
            "list_id",
            "list_member_status",
            "list_member_source",
            "list_member_unsubscribe_reason",
            "list_member_rating",
            "list_member_avg_open_rate",
            "list_member_avg_click_rate"
          ],
          changed_since: "adaptive",
        },
      ],
    },
  },
}
