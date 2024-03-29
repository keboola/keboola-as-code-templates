{
  parameters: {
    tableId: "out.c-ecommerce-wr-" + InstanceIdShort() + ".bdm_analyze_clv_by_time_from_previous_order",
    dbName: "bdm_analyze_clv_by_time_from_previous_order",
    incremental: false,
    primaryKey: [],
    items: [
      {
        name: "TIME_FROM_PREVIOUS_ORDER",
        dbName: "TIME_FROM_PREVIOUS_ORDER",
        type: "varchar",
        nullable: true,
        default: "",
        size: "30",
      },
      {
        name: "ORDERS",
        dbName: "ORDERS",
        type: "numeric",
        nullable: true,
        default: "",
        size: "18,0",
      },
      {
        name: "UNIQUE_CUSTOMERS",
        dbName: "UNIQUE_CUSTOMERS",
        type: "numeric",
        nullable: true,
        default: "",
        size: "18,0",
      },
      {
        name: "AVG_CLV",
        dbName: "AVG_CLV",
        type: "real",
        nullable: true,
        default: "",
        size: "",
      },
      {
        name: "ORDER_TOTAL_PRICE_TAXES",
        dbName: "ORDER_TOTAL_PRICE_TAXES",
        type: "real",
        nullable: true,
        default: "",
        size: "",
      },
      {
        name: "AVG_ORDER_PRICE",
        dbName: "AVG_ORDER_PRICE",
        type: "real",
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
          source: "out.c-ecommerce-wr-" + InstanceIdShort() + ".bdm_analyze_clv_by_time_from_previous_order",
          destination: "out.c-ecommerce-wr-" + InstanceIdShort() + ".bdm_analyze_clv_by_time_from_previous_order.csv",
          columns: [
            "TIME_FROM_PREVIOUS_ORDER",
            "ORDERS",
            "UNIQUE_CUSTOMERS",
            "AVG_CLV",
            "ORDER_TOTAL_PRICE_TAXES",
            "AVG_ORDER_PRICE",
          ],
          changed_since: "",
        },
      ],
    },
  },
}
