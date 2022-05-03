{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-ecommerce-wr-" + InstanceIdShort() + ".bdm_analyze_clv_by_time_from_previous_order",
          destination: "out.c-ecommerce-wr-" + InstanceIdShort() + ".bdm_analyze_clv_by_time_from_previous_order.csv",
          changed_since: "",
          columns: [
            "TIME_FROM_PREVIOUS_ORDER",
            "ORDERS",
            "UNIQUE_CUSTOMERS",
            "AVG_CLV",
            "ORDER_TOTAL_PRICE_VAT",
            "AVG_ORDER_PRICE",
          ],
        },
      ],
    },
  },
  parameters: {
    tables: [
      {
        dbName: "bdm_analyze_clv_by_time_from_previous_order",
        tableId: "out.c-ecommerce-wr-" + InstanceIdShort() + ".bdm_analyze_clv_by_time_from_previous_order",
        incremental: false,
        items: [
          {
            name: "TIME_FROM_PREVIOUS_ORDER",
            dbName: "TIME_FROM_PREVIOUS_ORDER",
            type: "STRING",
          },
          {
            name: "ORDERS",
            dbName: "ORDERS",
            type: "FLOAT",
          },
          {
            name: "UNIQUE_CUSTOMERS",
            dbName: "UNIQUE_CUSTOMERS",
            type: "FLOAT",
          },
          {
            name: "AVG_CLV",
            dbName: "AVG_CLV",
            type: "FLOAT",
          },
          {
            name: "ORDER_TOTAL_PRICE_VAT",
            dbName: "ORDER_TOTAL_PRICE_VAT",
            type: "FLOAT",
          },
          {
            name: "AVG_ORDER_PRICE",
            dbName: "AVG_ORDER_PRICE",
            type: "FLOAT",
          },
        ],
      },
    ],
  },
}
