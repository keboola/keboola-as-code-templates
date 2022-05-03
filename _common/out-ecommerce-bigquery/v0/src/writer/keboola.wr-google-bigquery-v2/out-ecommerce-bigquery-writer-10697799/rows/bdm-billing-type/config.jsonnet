{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-ecommerce-wr-" + InstanceIdShort() + ".bdm_billing_type",
          destination: "out.c-ecommerce-wr-" + InstanceIdShort() + ".bdm_billing_type.csv",
          changed_since: "",
          columns: [
            "BILLING_TYPE_ID",
            "NAME",
          ],
        },
      ],
    },
  },
  parameters: {
    tables: [
      {
        dbName: "bdm_billing_type",
        tableId: "out.c-ecommerce-wr-" + InstanceIdShort() + ".bdm_billing_type",
        incremental: false,
        items: [
          {
            name: "BILLING_TYPE_ID",
            dbName: "BILLING_TYPE_ID",
            type: "STRING",
          },
          {
            name: "NAME",
            dbName: "NAME",
            type: "STRING",
          },
        ],
      },
    ],
  },
}
