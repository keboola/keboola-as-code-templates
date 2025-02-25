{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-beer-demo.promo_deliveries",
          destination: "out.c-beer-demo.promo_deliveries.csv",
          changed_since: "",
          columns: [
            "CUSTOMER_ID",
            "PROMO",
            "CNT_BEERS_PURCHASED",
          ],
        },
      ],
    },
  },
  parameters: {
    tables: [
      {
        dbName: "promo_deliveries",
        tableId: "out.c-beer-demo.promo_deliveries",
        incremental: false,
        items: [
          {
            name: "CUSTOMER_ID",
            dbName: "CUSTOMER_ID",
            type: "INTEGER",
          },
          {
            name: "PROMO",
            dbName: "PROMO",
            type: "STRING",
          },
          {
            name: "CNT_BEERS_PURCHASED",
            dbName: "CNT_BEERS_PURCHASED",
            type: "INTEGER",
          },
        ],
      },
    ],
  },
}
