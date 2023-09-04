{
  parameters: {
    dbName: "bdm_shipping_type",
    incremental: false,
    items: [
      {
        dbName: "SHIPPING_TYPE_ID",
        default: "",
        name: "SHIPPING_TYPE_ID",
        nullable: true,
        size: "16777216",
        type: "varchar",
      },
      {
        dbName: "NAME",
        default: "",
        name: "NAME",
        nullable: true,
        size: "16777216",
        type: "varchar",
      },
    ],
    primaryKey: [
      "SHIPPING_TYPE_ID",
    ],
    tableId: "out.c-ecommerce-wr-JPblfJtg.bdm_shipping_type",
  },
  storage: {
    input: {
      tables: [
        {
          columns: [
            "SHIPPING_TYPE_ID",
            "NAME",
          ],
          destination: "out.c-ecommerce-wr-JPblfJtg.bdm_shipping_type.csv",
          source: "out.c-ecommerce-wr-JPblfJtg.bdm_shipping_type",
        },
      ],
    },
  },
}
