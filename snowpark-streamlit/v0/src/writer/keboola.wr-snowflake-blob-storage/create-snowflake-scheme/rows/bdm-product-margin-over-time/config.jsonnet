{
  parameters: {
    dbName: "bdm_product_margin_over_time",
    incremental: false,
    items: [
      {
        dbName: "ORDER_DATE",
        default: "",
        name: "ORDER_DATE",
        nullable: true,
        size: "",
        type: "date",
      },
      {
        dbName: "PRODUCT_ID",
        default: "",
        name: "PRODUCT_ID",
        nullable: true,
        size: "16777216",
        type: "varchar",
      },
      {
        dbName: "AVG_ORDER_LINE_MARGIN",
        default: "",
        name: "AVG_ORDER_LINE_MARGIN",
        nullable: true,
        size: "38,12",
        type: "number",
      },
    ],
    primaryKey: [],
    tableId: "out.c-ecommerce-wr-JPblfJtg.bdm_product_margin_over_time",
  },
  storage: {
    input: {
      tables: [
        {
          columns: [
            "ORDER_DATE",
            "PRODUCT_ID",
            "AVG_ORDER_LINE_MARGIN",
          ],
          destination: "out.c-ecommerce-wr-JPblfJtg.bdm_product_margin_over_time.csv",
          source: "out.c-ecommerce-wr-JPblfJtg.bdm_product_margin_over_time",
        },
      ],
    },
  },
}
