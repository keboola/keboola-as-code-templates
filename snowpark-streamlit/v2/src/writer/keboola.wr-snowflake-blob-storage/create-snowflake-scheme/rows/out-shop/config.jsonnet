{
  parameters: {
    dbName: "out_shop",
    incremental: false,
    items: [
      {
        dbName: "NAME",
        default: "",
        name: "NAME",
        nullable: true,
        size: "16777216",
        type: "varchar",
      },
      {
        dbName: "BASE_URL",
        default: "",
        name: "BASE_URL",
        nullable: true,
        size: "16777216",
        type: "varchar",
      },
      {
        dbName: "DOMAIN",
        default: "",
        name: "DOMAIN",
        nullable: true,
        size: "16777216",
        type: "varchar",
      },
    ],
    primaryKey: [],
    tableId: "out.c-ecommerce-wr-JPblfJtg.out_shop",
  },
  storage: {
    input: {
      tables: [
        {
          columns: [
            "NAME",
            "BASE_URL",
            "DOMAIN",
          ],
          destination: "out.c-ecommerce-wr-JPblfJtg.out_shop.csv",
          source: "out.c-ecommerce-wr-JPblfJtg.out_shop",
        },
      ],
    },
  },
}
