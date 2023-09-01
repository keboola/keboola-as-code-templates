{
  parameters: {},
  storage: {
    input: {
      tables: [
        {
          columns: [],
          destination: "line_item_tax_lines",
          source: "in.c-demo-kds-team-ex-shopify-" + ConfigId("import-shopify-demo-data") + ".line-item-tax-lines",
          where_column: "",
          where_operator: "eq",
          where_values: [],
        },
        {
          columns: [],
          destination: "product_options",
          source: "in.c-demo-kds-team-ex-shopify-" + ConfigId("import-shopify-demo-data") + ".product-options",
          where_column: "",
          where_operator: "eq",
          where_values: [],
        },
        {
          columns: [],
          destination: "order",
          source: "in.c-demo-kds-team-ex-shopify-" + ConfigId("import-shopify-demo-data") + ".order",
          where_column: "",
          where_operator: "eq",
          where_values: [],
        },
        {
          columns: [],
          destination: "product",
          source: "in.c-demo-kds-team-ex-shopify-" + ConfigId("import-shopify-demo-data") + ".product",
          where_column: "",
          where_operator: "eq",
          where_values: [],
        },
        {
          columns: [],
          destination: "customer",
          source: "in.c-demo-kds-team-ex-shopify-" + ConfigId("import-shopify-demo-data") + ".customer",
          where_column: "",
          where_operator: "eq",
          where_values: [],
        },
        {
          columns: [],
          destination: "order_discount_applications",
          source: "in.c-demo-kds-team-ex-shopify-" + ConfigId("import-shopify-demo-data") + ".order-discount-applications",
          where_column: "",
          where_operator: "eq",
          where_values: [],
        },
        {
          columns: [],
          destination: "product_variant",
          source: "in.c-demo-kds-team-ex-shopify-" + ConfigId("import-shopify-demo-data") + ".product-variant",
          where_column: "",
          where_operator: "eq",
          where_values: [],
        },
        {
          columns: [],
          destination: "order_fulfillments",
          source: "in.c-demo-kds-team-ex-shopify-" + ConfigId("import-shopify-demo-data") + ".order-fulfillments",
          where_column: "",
          where_operator: "eq",
          where_values: [],
        },
        {
          columns: [],
          destination: "order_tax_lines",
          source: "in.c-demo-kds-team-ex-shopify-" + ConfigId("import-shopify-demo-data") + ".order-tax-lines",
          where_column: "",
          where_operator: "eq",
          where_values: [],
        },
        {
          columns: [],
          destination: "product_images",
          source: "in.c-demo-kds-team-ex-shopify-" + ConfigId("import-shopify-demo-data") + ".product-images",
          where_column: "",
          where_operator: "eq",
          where_values: [],
        },
        {
          columns: [],
          destination: "inventory_items",
          source: "in.c-demo-kds-team-ex-shopify-" + ConfigId("import-shopify-demo-data") + ".inventory-items",
          where_column: "",
          where_operator: "eq",
          where_values: [],
        },
        {
          columns: [],
          destination: "line_item",
          source: "in.c-demo-kds-team-ex-shopify-" + ConfigId("import-shopify-demo-data") + ".line-item",
          where_column: "",
          where_operator: "eq",
          where_values: [],
        },
        {
          columns: [],          
          destination: "bdm_orders",
          source: "out.c-ecommerce-wr-JPblfJtg.bdm_orders",          
          where_column: "",
          where_operator: "eq",
          where_values: [],          
        },
      ],
    },
    output: {
      tables: [
        {
          destination: "out.c-ecommerce-wr-JPblfJtg.bdm_orders",
          primary_key: [
            "ORDER_ID",
          ],
          source: "bdm_orders",
        },
        {
          destination: "out.c-ecommerce-wr-JPblfJtg.bdm_order_lines",
          primary_key: [
            "ORDER_LINE_ID",
          ],
          source: "bdm_order_lines",
        },
        {
          destination: "out.c-ecommerce-wr-JPblfJtg.bdm_shipping_type",
          primary_key: [
            "SHIPPING_TYPE_ID",
          ],
          source: "bdm_shipping_type",
        },
        {
          destination: "out.c-ecommerce-wr-JPblfJtg.bdm_billing_type",
          primary_key: [
            "BILLING_TYPE_ID",
          ],
          source: "bdm_billing_type",
        },
        {
          destination: "out.c-ecommerce-wr-JPblfJtg.bdm_customers",
          primary_key: [
            "CUSTOMER_ACCOUNT_GUID",
          ],
          source: "bdm_customers",
        },
        {
          destination: "out.c-ecommerce-wr-JPblfJtg.bdm_products",
          primary_key: [
            "PRODUCT_ID",
          ],
          source: "bdm_products",
        },
        {
          destination: "out.c-ecommerce-wr-JPblfJtg.bdm_analyze_clv_by_order_count",
          source: "analyze_clv_by_order_count",
        },
        {
          destination: "out.c-ecommerce-wr-JPblfJtg.bdm_analyze_clv_by_time_from_previous_order",
          source: "analyze_clv_by_time_from_previous_order",
        },
        {
          destination: "out.c-ecommerce-wr-JPblfJtg.bdm_product_margin_over_time",
          source: "bdm_product_margin_over_time",
        },
        {
          destination: "out.c-ecommerce-wr-JPblfJtg.out_shop",
          source: "out_shop",
        },
      ],
    },
  },
}
