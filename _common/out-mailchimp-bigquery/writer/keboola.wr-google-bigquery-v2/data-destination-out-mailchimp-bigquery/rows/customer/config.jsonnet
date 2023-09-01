{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-mailchimp-bdm-" + InstanceIdShort() + ".customer",
          destination: "out.c-mailchimp-bdm-" + InstanceIdShort() + ".customer.csv",
          changed_since: "adaptive",
          columns: [
            "customer_id",
            "customer_email_address",
            "name",
          ],
        },
      ],
    },
  },
  parameters: {
    tables: [
      {
        dbName: "customer",
        tableId: "out.c-mailchimp-bdm-" + InstanceIdShort() + ".customer",
        incremental: true,
        items: [
          {
            name: "customer_id",
            dbName: "customer_id",
            type: "STRING",
          },
          {
            name: "customer_email_address",
            dbName: "customer_email_address",
            type: "STRING",
          },
          {
            name: "name",
            dbName: "name",
            type: "STRING",
          },
        ],
      },
    ],
  },
}
