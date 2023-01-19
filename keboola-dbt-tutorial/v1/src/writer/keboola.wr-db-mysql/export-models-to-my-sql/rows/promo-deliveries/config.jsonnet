{
  parameters: {
    tableId: "out.c-beer-demo.promo_deliveries",
    dbName: "promo_deliveries",
    incremental: false,
    primaryKey: [
      "CUSTOMER_ID",
    ],
    items: [
      {
        name: "CUSTOMER_ID",
        dbName: "CUSTOMER_ID",
        type: "INT",
        nullable: true,
        default: "",
        size: "",
      },
      {
        name: "PROMO",
        dbName: "PROMO",
        type: "VARCHAR",
        nullable: true,
        default: "",
        size: "255",
      },
      {
        name: "CNT_BEERS_PURCHASED",
        dbName: "CNT_BEERS_PURCHASED",
        type: "INT",
        nullable: true,
        default: "",
        size: "",
      },
    ],
  },
  storage: {
    input: {
      tables: [
        {
          source: "out.c-beer-demo.promo_deliveries",
          destination: "out.c-beer-demo.promo_deliveries.csv",
          columns: [
            "CUSTOMER_ID",
            "PROMO",
            "CNT_BEERS_PURCHASED",
          ],
        },
      ],
    },
  },
}
