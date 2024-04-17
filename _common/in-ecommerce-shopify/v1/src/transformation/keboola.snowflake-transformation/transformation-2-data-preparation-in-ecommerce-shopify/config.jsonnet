{
  parameters: {},
  storage: {
    input: {
      tables: [
        {
          source: "in.c-kds-team-ex-shopify-" + ConfigId("data-source-in-ecommerce-shopify") + ".order_discount_applications",
          destination: "order_discount_applications",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
          keep_internal_timestamp_column: false,
        },
        {
          source: "in.c-kds-team-ex-shopify-" + ConfigId("data-source-in-ecommerce-shopify") + ".product_variant",
          destination: "product_variant",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
          keep_internal_timestamp_column: false,
        },
        {
          source: "in.c-kds-team-ex-shopify-" + ConfigId("data-source-in-ecommerce-shopify") + ".inventory_items",
          destination: "inventory_items",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
          keep_internal_timestamp_column: false,
        },
        {
          source: "in.c-kds-team-ex-shopify-" + ConfigId("data-source-in-ecommerce-shopify") + ".line_item",
          destination: "line_item",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
          keep_internal_timestamp_column: false,
        },
        {
          source: "in.c-kds-team-ex-shopify-" + ConfigId("data-source-in-ecommerce-shopify") + ".customer",
          destination: "customer",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
          keep_internal_timestamp_column: false,
        },
        {
          source: "in.c-kds-team-ex-shopify-" + ConfigId("data-source-in-ecommerce-shopify") + ".order_fulfillments",
          destination: "order_fulfillments",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
          keep_internal_timestamp_column: false,
        },
        {
          source: "in.c-kds-team-ex-shopify-" + ConfigId("data-source-in-ecommerce-shopify") + ".line_item_tax_lines",
          destination: "line_item_tax_lines",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
          keep_internal_timestamp_column: false,
        },
        {
          source: "in.c-kds-team-ex-shopify-" + ConfigId("data-source-in-ecommerce-shopify") + ".order",
          destination: "order",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
          keep_internal_timestamp_column: false,
        },
        {
          source: "in.c-kds-team-ex-shopify-" + ConfigId("data-source-in-ecommerce-shopify") + ".product",
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
          destination: "out.c-ecommerce-wr-" + InstanceIdShort() + ".bdm_products",
          source: "bdm_products",
          primary_key: [
            "PRODUCT_ID",
          ],
        },
        {
          destination: "out.c-ecommerce-wr-" + InstanceIdShort() + ".bdm_customers",
          source: "bdm_customers",
          primary_key: [
            "CUSTOMER_ID",
          ],
        },
      ],
    },
  },
}
