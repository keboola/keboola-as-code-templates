{
  parameters: {
    tableId: "out.c-mailchimp-bdm-" + InstanceIdShort() + ".customer",
    dbName: "customer",
    incremental: true,
    primaryKey: [
      "customer_id",
    ],
    items: [
      {
        name: "customer_id",
        dbName: "customer_id",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
      {
        name: "customer_email_address",
        dbName: "customer_email_address",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
      {
        name: "name",
        dbName: "name",
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
          source: "out.c-mailchimp-bdm-" + InstanceIdShort() + ".customer",
          destination: "out.c-mailchimp-bdm-" + InstanceIdShort() + ".customer.csv",
          columns: [
            "customer_id",
            "customer_email_address",
            "name",
          ],
          changed_since: "adaptive",
        },
      ],
    },
  },
}
