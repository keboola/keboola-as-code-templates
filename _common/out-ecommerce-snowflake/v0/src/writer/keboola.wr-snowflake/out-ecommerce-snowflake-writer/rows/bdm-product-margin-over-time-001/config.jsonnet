{
  parameters: {
    tableId: "out.c-ecommerce-wr-" + InstanceIdShort() + ".bdm_product_margin_over_time",
    dbName: "bdm_product_margin_over_time",
    incremental: false,
    primaryKey: [],
    items: [
      {
        name: "ORDER_DATE",
        dbName: "ORDER_DATE",
        type: "date",
        nullable: true,
        default: "",
        size: "",
      },
      {
        name: "PRODUCT_ID",
        dbName: "PRODUCT_ID",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
      {
        name: "AVG_ORDER_LINE_MARGIN",
        dbName: "AVG_ORDER_LINE_MARGIN",
        type: "number",
        nullable: true,
        default: "",
        size: "38,12",
      },
    ],
  },
  storage: {
    input: {
      tables: [
        {
          source: "out.c-ecommerce-wr-" + InstanceIdShort() + ".bdm_product_margin_over_time",
          destination: "out.c-ecommerce-wr-" + InstanceIdShort() + ".bdm_product_margin_over_time.csv",
          columns: [
            "ORDER_DATE",
            "PRODUCT_ID",
            "AVG_ORDER_LINE_MARGIN",
          ],
        },
      ],
    },
  },
}
