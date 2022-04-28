{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-ecommerce-wr-" + ConfigId("out-ecommerce-bigquery-writer-10697799") + ".bdm_shipping_type",
          destination: "out.c-ecommerce-wr-" + ConfigId("out-ecommerce-bigquery-writer-10697799") + ".bdm_shipping_type.csv",
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
        tableId: "out.c-ecommerce-wr-" + ConfigId("out-ecommerce-bigquery-writer-10697799") + ".bdm_shipping_type",
        incremental: false,
        items: [
          {
            name: "SHIPPING_TYPE_ID",
            dbName: "SHIPPING_TYPE_ID",
            type: "FLOAT",
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
