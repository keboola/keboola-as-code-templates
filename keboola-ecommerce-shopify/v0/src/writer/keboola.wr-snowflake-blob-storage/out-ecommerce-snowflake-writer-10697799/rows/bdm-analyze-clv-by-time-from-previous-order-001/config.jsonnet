{
  parameters: {
    tableId: "out.c-ecommerce-bdm-"+ConfigId("in-ecommerce-shopify-extractor-10697799")+".bdm_analyze_clv_by_time_from_previous_order",
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
        type: "number",
        nullable: true,
        default: "",
        size: "18,0",
      },
      {
        name: "UNIQUE_CUTOMERS",
        dbName: "UNIQUE_CUTOMERS",
        type: "number",
        nullable: true,
        default: "",
        size: "18,0",
      },
      {
        name: "AVG_CLV",
        dbName: "AVG_CLV",
        type: "float",
        nullable: true,
        default: "",
        size: "",
      },
      {
        name: "ORDER_TOTAL_PRICE_VAT",
        dbName: "ORDER_TOTAL_PRICE_VAT",
        type: "float",
        nullable: true,
        default: "",
        size: "",
      },
      {
        name: "AVG_ORDER_PRICE",
        dbName: "AVG_ORDER_PRICE",
        type: "float",
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
          source: "out.c-ecommerce-bdm-"+ConfigId("in-ecommerce-shopify-extractor-10697799")+".bdm_analyze_clv_by_time_from_previous_order",
          destination: "out.c-ecommerce-bdm-"+ConfigId("in-ecommerce-shopify-extractor-10697799")+".bdm_analyze_clv_by_time_from_previous_order.csv",
          columns: [
            "TIME_FROM_PREVIOUS_ORDER",
            "ORDERS",
            "UNIQUE_CUTOMERS",
            "AVG_CLV",
            "ORDER_TOTAL_PRICE_VAT",
            "AVG_ORDER_PRICE",
          ],
        },
      ],
    },
  },
}
