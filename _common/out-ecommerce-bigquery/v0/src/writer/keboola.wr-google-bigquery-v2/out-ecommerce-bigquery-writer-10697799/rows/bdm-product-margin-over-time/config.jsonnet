{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-ecommerce-wr-" + ConfigId("out-ecommerce-bigquery-writer-10697799") + ".bdm_product_margin_over_time",
          destination: "out.c-ecommerce-wr-" + ConfigId("out-ecommerce-bigquery-writer-10697799") + ".bdm_product_margin_over_time.csv",
          changed_since: "",
          columns: [
            "ORDER_DATE",
            "PRODUCT_ID",
            "AVG_ORDER_LINE_MARGIN",
          ],
        },
      ],
    },
  },
  parameters: {
    tables: [
      {
        dbName: "bdm_product_margin_over_time",
        tableId: "out.c-ecommerce-wr-" + ConfigId("out-ecommerce-bigquery-writer-10697799") + ".bdm_product_margin_over_time",
        incremental: false,
        items: [
          {
            name: "ORDER_DATE",
            dbName: "ORDER_DATE",
            type: "TIMESTAMP",
          },
          {
            name: "PRODUCT_ID",
            dbName: "PRODUCT_ID",
            type: "STRING",
          },
          {
            name: "AVG_ORDER_LINE_MARGIN",
            dbName: "AVG_ORDER_LINE_MARGIN",
            type: "FLOAT",
          },
        ],
      },
    ],
  },
}
