{
  parameters: {
    tableId: "out.c-ecommerce-wr-" + InstanceIdShort() + ".out_shop",
    dbName: "out_shop",
    incremental: false,
    primaryKey: [],
    items: [
      {
        name: "NAME",
        dbName: "NAME",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
      {
        name: "BASE_URL",
        dbName: "BASE_URL",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
      {
        name: "DOMAIN",
        dbName: "DOMAIN",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
    ],
  },
  storage: {
    input: {
      tables: [
        {
          source: "out.c-ecommerce-wr-" + InstanceIdShort() + ".out_shop",
          destination: "out.c-ecommerce-wr-" + InstanceIdShort() + ".out_shop.csv",
          columns: [
            "NAME",
            "BASE_URL",
            "DOMAIN",
          ],
        },
      ],
    },
  },
}
