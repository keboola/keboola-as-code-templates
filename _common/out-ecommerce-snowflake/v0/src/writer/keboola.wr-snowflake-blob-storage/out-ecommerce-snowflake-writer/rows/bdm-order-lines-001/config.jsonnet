{
  parameters: {
    tableId: "out.c-ecommerce-wr-" + InstanceIdShort() + ".bdm_order_lines",
    dbName: "bdm_order_lines",
    incremental: false,
    primaryKey: [
      "ORDER_LINE_ID",
    ],
    items: [
      {
        name: "ORDER_ID",
        dbName: "ORDER_ID",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
      {
        name: "ORDER_LINE_ID",
        dbName: "ORDER_LINE_ID",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
      {
        name: "ORDER_DATE",
        dbName: "ORDER_DATE",
        type: "timestamp_tz",
        nullable: true,
        default: "",
        size: "",
      },
      {
        name: "ORDER_LINE_PRODUCT_ID",
        dbName: "ORDER_LINE_PRODUCT_ID",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
      {
        name: "ITEMNAME",
        dbName: "ITEMNAME",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
      {
        name: "DISCOUNT_PERCENT",
        dbName: "DISCOUNT_PERCENT",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
      {
        name: "ORDER_LINE_AMOUNT",
        dbName: "ORDER_LINE_AMOUNT",
        type: "number",
        nullable: true,
        default: "",
        size: "18,5",
      },
      {
        name: "ORDER_LINE_PRICE_WITH_TAXES",
        dbName: "ORDER_LINE_PRICE_WITH_TAXES",
        type: "number",
        nullable: true,
        default: "",
        size: "22,5",
      },
      {
        name: "ORDER_LINE_PRICE_WITHOUT_TAXES",
        dbName: "ORDER_LINE_PRICE_WITHOUT_TAXES",
        type: "number",
        nullable: true,
        default: "",
        size: "38,0",
      },
      {
        name: "ORDER_LINE_PRICE_TAXES",
        dbName: "ORDER_LINE_PRICE_TAXES",
        type: "number",
        nullable: true,
        default: "",
        size: "18,5",
      },
      {
        name: "ORDER_LINE_TAXES_RATE",
        dbName: "ORDER_LINE_TAXES_RATE",
        type: "number",
        nullable: true,
        default: "",
        size: "18,5",
      },
      {
        name: "LINE_PURCHASE_PRICE",
        dbName: "LINE_PURCHASE_PRICE",
        type: "number",
        nullable: true,
        default: "",
        size: "18,5",
      },
      {
        name: "ORDER_ITEM_TYPE",
        dbName: "ORDER_ITEM_TYPE",
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
          source: "out.c-ecommerce-wr-" + InstanceIdShort() + ".bdm_order_lines",
          destination: "out.c-ecommerce-wr-" + InstanceIdShort() + ".bdm_order_lines.csv",
          columns: [
            "ORDER_ID",
            "ORDER_LINE_ID",
            "ORDER_DATE",
            "ORDER_LINE_PRODUCT_ID",
            "ITEMNAME",
            "DISCOUNT_PERCENT",
            "ORDER_LINE_AMOUNT",
            "ORDER_LINE_PRICE_WITH_TAXES",
            "ORDER_LINE_PRICE_WITHOUT_TAXES",
            "ORDER_LINE_PRICE_TAXES",
            "ORDER_LINE_TAXES_RATE",
            "LINE_PURCHASE_PRICE",
            "ORDER_ITEM_TYPE",
          ],
        },
      ],
    },
  },
}
