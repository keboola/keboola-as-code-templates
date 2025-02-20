{
  parameters: {
    dbName: "bdm_analyze_clv_by_order_count",
    incremental: false,
    items: [
      {
        dbName: "CUSTOMER_CATEGORY_BY_ORDER_COUNT",
        default: "",
        name: "CUSTOMER_CATEGORY_BY_ORDER_COUNT",
        nullable: true,
        size: "21",
        type: "varchar",
      },
      {
        dbName: "ORDERS",
        default: "",
        name: "ORDERS",
        nullable: true,
        size: "18,0",
        type: "number",
      },
      {
        dbName: "UNIQUE_CUSTOMERS",
        default: "",
        name: "UNIQUE_CUSTOMERS",
        nullable: true,
        size: "18,0",
        type: "number",
      },
      {
        dbName: "AVG_CLV",
        default: "",
        name: "AVG_CLV",
        nullable: true,
        size: "",
        type: "float",
      },
      {
        dbName: "ORDER_TOTAL_PRICE_TAXES",
        default: "",
        name: "ORDER_TOTAL_PRICE_TAXES",
        nullable: true,
        size: "",
        type: "float",
      },
      {
        dbName: "AVG_ORDER_PRICE",
        default: "",
        name: "AVG_ORDER_PRICE",
        nullable: true,
        size: "",
        type: "float",
      },
    ],
    primaryKey: [],
    tableId: "out.c-ecommerce-wr-JPblfJtg.bdm_analyze_clv_by_order_count",
  },
  storage: {
    input: {
      tables: [
        {
          columns: [
            "CUSTOMER_CATEGORY_BY_ORDER_COUNT",
            "ORDERS",
            "UNIQUE_CUSTOMERS",
            "AVG_CLV",
            "ORDER_TOTAL_PRICE_TAXES",
            "AVG_ORDER_PRICE",
          ],
          destination: "out.c-ecommerce-wr-JPblfJtg.bdm_analyze_clv_by_order_count.csv",
          source: "out.c-ecommerce-wr-JPblfJtg.bdm_analyze_clv_by_order_count",
        },
      ],
    },
  },
}
