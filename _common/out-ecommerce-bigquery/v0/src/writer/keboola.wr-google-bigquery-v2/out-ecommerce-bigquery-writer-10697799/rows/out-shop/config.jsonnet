{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-ecommerce-wr-" + ConfigId("out-ecommerce-bigquery-writer-10697799") + ".out_shop",
          destination: "out.c-ecommerce-wr-" + ConfigId("out-ecommerce-bigquery-writer-10697799") + ".out_shop.csv",
          changed_since: "",
          columns: [
            "NAME",
            "BASE_URL",
            "DOMAIN",
          ],
        },
      ],
    },
  },
  parameters: {
    tables: [
      {
        dbName: "out_shop",
        tableId: "out.c-ecommerce-wr-" + ConfigId("out-ecommerce-bigquery-writer-10697799") + ".out_shop",
        incremental: false,
        items: [
          {
            name: "NAME",
            dbName: "NAME",
            type: "STRING",
          },
          {
            name: "BASE_URL",
            dbName: "BASE_URL",
            type: "STRING",
          },
          {
            name: "DOMAIN",
            dbName: "DOMAIN",
            type: "STRING",
          },
        ],
      },
    ],
  },
}
