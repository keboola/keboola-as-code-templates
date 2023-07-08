{
  parameters: {
    tableId: "out.c-ecommerce-wr-" + InstanceIdShort() + ".bdm_billing_type",
    dbName: "bdm_billing_type",
    incremental: false,
    primaryKey: [
      "BILLING_TYPE_ID",
    ],
    items: [
      {
        name: "BILLING_TYPE_ID",
        dbName: "BILLING_TYPE_ID",
        type: "varchar",
        nullable: false,
        default: "",
        size: "3000",
      },
      {
        name: "NAME",
        dbName: "NAME",
        type: "varchar",
        nullable: true,
        default: "",
        size: "3000",
      },
    ],
  },
  storage: {
    input: {
      tables: [
        {
          source: "out.c-ecommerce-wr-" + InstanceIdShort() + ".bdm_billing_type",
          destination: "out.c-ecommerce-wr-" + InstanceIdShort() + ".bdm_billing_type.csv",
          columns: [
            "BILLING_TYPE_ID",
            "NAME",
          ],
          changed_since: "",
        },
      ],
    },
  },
}
