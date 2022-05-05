{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-ecommerce-wr-" + InstanceIdShort() + ".out_shop",
          destination: "out.c-ecommerce-wr-" + InstanceIdShort() + ".out_shop.csv",
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
        tableId: "out.c-ecommerce-wr-" + InstanceIdShort() + ".out_shop",
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
