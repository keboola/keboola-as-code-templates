{
  parameters: {
    dbName: "bdm_analyze_clv_by_time_from_previous_order",
    incremental: false,
    items: [
      {
        dbName: "TIME_FROM_PREVIOUS_ORDER",
        default: "",
        name: "TIME_FROM_PREVIOUS_ORDER",
        nullable: true,
        size: "30",
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
    tableId: "out.c-ecommerce-wr-JPblfJtg.bdm_analyze_clv_by_time_from_previous_order",
  },
  storage: {
    input: {
      tables: [
        {
          columns: [
            "TIME_FROM_PREVIOUS_ORDER",
            "ORDERS",
            "UNIQUE_CUSTOMERS",
            "AVG_CLV",
            "ORDER_TOTAL_PRICE_TAXES",
            "AVG_ORDER_PRICE",
          ],
          destination: "out.c-ecommerce-wr-JPblfJtg.bdm_analyze_clv_by_time_from_previous_order.csv",
          source: "out.c-ecommerce-wr-JPblfJtg.bdm_analyze_clv_by_time_from_previous_order",
        },
      ],
    },
  },
}
