{
  parameters: {
    dbName: "bdm_billing_type",
    incremental: false,
    items: [
      {
        dbName: "BILLING_TYPE_ID",
        default: "",
        name: "BILLING_TYPE_ID",
        nullable: true,
        size: "16777216",
        type: "varchar",
      },
      {
        dbName: "NAME",
        default: "",
        name: "NAME",
        nullable: true,
        size: "16777216",
        type: "varchar",
      },
    ],
    primaryKey: [
      "BILLING_TYPE_ID",
    ],
    tableId: "out.c-ecommerce-wr-JPblfJtg.bdm_billing_type",
  },
  storage: {
    input: {
      tables: [
        {
          columns: [
            "BILLING_TYPE_ID",
            "NAME",
          ],
          destination: "out.c-ecommerce-wr-JPblfJtg.bdm_billing_type.csv",
          source: "out.c-ecommerce-wr-JPblfJtg.bdm_billing_type",
        },
      ],
    },
  },
}
