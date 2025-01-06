{
  parameters: {},
  storage: {
    input: {
      tables: [
        {
          source: "in.c-kds-team-ex-woocommerce-" + ConfigId("data-source-in-ecommerce-woocommerce") + ".customer",
          destination: "customer",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
          keep_internal_timestamp_column: false,
        },
        {
          source: "in.c-kds-team-ex-woocommerce-" + ConfigId("data-source-in-ecommerce-woocommerce") + ".order",
          destination: "order",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
          keep_internal_timestamp_column: false,
        },
        {
          source: "in.c-kds-team-ex-woocommerce-" + ConfigId("data-source-in-ecommerce-woocommerce") + ".order__line_items",
          destination: "order_line_items",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
          keep_internal_timestamp_column: false,
        },
        {
          source: "in.c-kds-team-ex-woocommerce-" + ConfigId("data-source-in-ecommerce-woocommerce") + ".product",
          destination: "product",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
          keep_internal_timestamp_column: false,
        },
      ],
    },
    output: {
      tables: [
        {
          destination: "out.c-ecommerce-wr-" + InstanceIdShort() + ".bdm_orders",
          source: "bdm_orders",
          primary_key: [
            "ORDER_ID",
          ],
        },
        {
          destination: "out.c-ecommerce-wr-" + InstanceIdShort() + ".bdm_order_lines",
          source: "bdm_order_lines",
          primary_key: [
            "ORDER_LINE_ID",
          ],
        },
        {
          destination: "out.c-ecommerce-wr-" + InstanceIdShort() + ".bdm_customers",
          source: "bdm_customers",
          primary_key: [
            "CUSTOMER_ID",
          ],
        },
        {
          destination: "out.c-ecommerce-wr-" + InstanceIdShort() + ".bdm_products",
          source: "bdm_products",
          primary_key: [
            "PRODUCT_ID",
          ],
        },
      ],
    },
  },
  runtime: {
    process_timeout: 7200
  },
}
