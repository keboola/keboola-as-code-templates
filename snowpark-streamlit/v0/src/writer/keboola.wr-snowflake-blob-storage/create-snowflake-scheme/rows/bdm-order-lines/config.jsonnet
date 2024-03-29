{
  parameters: {
    dbName: "bdm_order_lines",
    incremental: false,
    items: [
      {
        dbName: "ORDER_ID",
        default: "",
        name: "ORDER_ID",
        nullable: true,
        size: "16777216",
        type: "varchar",
      },
      {
        dbName: "ORDER_LINE_ID",
        default: "",
        name: "ORDER_LINE_ID",
        nullable: true,
        size: "16777216",
        type: "varchar",
      },
      {
        dbName: "ORDER_DATE",
        default: "",
        name: "ORDER_DATE",
        nullable: true,
        size: "",
        type: "timestamp_tz",
      },
      {
        dbName: "ORDER_LINE_PRODUCT_ID",
        default: "",
        name: "ORDER_LINE_PRODUCT_ID",
        nullable: true,
        size: "16777216",
        type: "varchar",
      },
      {
        dbName: "ITEMNAME",
        default: "",
        name: "ITEMNAME",
        nullable: true,
        size: "16777216",
        type: "varchar",
      },
      {
        dbName: "DISCOUNT_PERCENT",
        default: "",
        name: "DISCOUNT_PERCENT",
        nullable: true,
        size: "19,5",
        type: "number",
      },
      {
        dbName: "ORDER_LINE_AMOUNT",
        default: "",
        name: "ORDER_LINE_AMOUNT",
        nullable: true,
        size: "18,5",
        type: "number",
      },
      {
        dbName: "ORDER_LINE_PRICE_WITH_TAXES",
        default: "",
        name: "ORDER_LINE_PRICE_WITH_TAXES",
        nullable: true,
        size: "22,5",
        type: "number",
      },
      {
        dbName: "ORDER_LINE_PRICE_WITHOUT_TAXES",
        default: "",
        name: "ORDER_LINE_PRICE_WITHOUT_TAXES",
        nullable: true,
        size: "38,0",
        type: "number",
      },
      {
        dbName: "ORDER_LINE_PRICE_TAXES",
        default: "",
        name: "ORDER_LINE_PRICE_TAXES",
        nullable: true,
        size: "18,5",
        type: "number",
      },
      {
        dbName: "ORDER_LINE_TAXES_RATE",
        default: "",
        name: "ORDER_LINE_TAXES_RATE",
        nullable: true,
        size: "18,5",
        type: "number",
      },
      {
        dbName: "LINE_PURCHASE_PRICE",
        default: "",
        name: "LINE_PURCHASE_PRICE",
        nullable: true,
        size: "18,5",
        type: "number",
      },
      {
        dbName: "ORDER_ITEM_TYPE",
        default: "",
        name: "ORDER_ITEM_TYPE",
        nullable: true,
        size: "16777216",
        type: "varchar",
      },
    ],
    primaryKey: [
      "ORDER_LINE_ID",
    ],
    tableId: "out.c-ecommerce-wr-JPblfJtg.bdm_order_lines",
  },
  storage: {
    input: {
      tables: [
        {
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
          destination: "out.c-ecommerce-wr-JPblfJtg.bdm_order_lines.csv",
          source: "out.c-ecommerce-wr-JPblfJtg.bdm_order_lines",
        },
      ],
    },
  },
}
