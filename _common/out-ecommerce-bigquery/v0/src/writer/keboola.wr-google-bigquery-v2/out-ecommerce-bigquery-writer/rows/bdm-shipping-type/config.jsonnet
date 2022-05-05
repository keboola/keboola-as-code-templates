{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-ecommerce-wr-" + InstanceIdShort() + ".bdm_shipping_type",
          destination: "out.c-ecommerce-wr-" + InstanceIdShort() + ".bdm_shipping_type.csv",
          changed_since: "",
          columns: [
            "SHIPPING_TYPE_ID",
            "NAME",
          ],
        },
      ],
    },
  },
  parameters: {
    tables: [
      {
        dbName: "bdm_shipping_type",
        tableId: "out.c-ecommerce-wr-" + InstanceIdShort() + ".bdm_shipping_type",
        incremental: false,
        items: [
          {
            name: "SHIPPING_TYPE_ID",
            dbName: "SHIPPING_TYPE_ID",
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
