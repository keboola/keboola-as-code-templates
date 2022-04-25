{
  parameters: {
    tableId: "out.c-ecommerce-wr-"+ConfigId("in-ecommerce-shopify-extractor-10697799")+".bdm_analyze_clv_by_order_count",
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
          source: "out.c-ecommerce-wr-"+ConfigId("in-ecommerce-shopify-extractor-10697799")+".bdm_analyze_clv_by_order_count",
          destination: "out.c-ecommerce-wr-"+ConfigId("in-ecommerce-shopify-extractor-10697799")+".bdm_analyze_clv_by_order_count.csv",
          columns: [
            "CUSTOMER_CATEGORY_BY_ORDER_COUNT",
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
