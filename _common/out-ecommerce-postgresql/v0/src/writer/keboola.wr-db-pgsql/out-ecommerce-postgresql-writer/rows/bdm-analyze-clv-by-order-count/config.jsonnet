{
  parameters: {
    tableId: "out.c-ecommerce-wr-" + InstanceIdShort() + ".bdm_analyze_clv_by_order_count",
    dbName: "bdm_analyze_clv_by_order_count",
    incremental: false,
    primaryKey: [],
    items: [
      {
        name: "CUSTOMER_CATEGORY_BY_ORDER_COUNT",
        dbName: "CUSTOMER_CATEGORY_BY_ORDER_COUNT",
        type: "varchar",
        nullable: true,
        default: "",
        size: "21",
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
          source: "out.c-ecommerce-wr-" + InstanceIdShort() + ".bdm_analyze_clv_by_order_count",
          destination: "out.c-ecommerce-wr-" + InstanceIdShort() + ".bdm_analyze_clv_by_order_count.csv",
          columns: [
            "CUSTOMER_CATEGORY_BY_ORDER_COUNT",
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
