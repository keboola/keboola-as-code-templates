{
  parameters: {},
  storage: {
    input: {
      tables: [
        {
          source: "in.c-kds-team-ex-shopify-" + ConfigId("in-ecommerce-shopify-extractor-10697799") + ".line_item_tax_lines",
          destination: "line_item_tax_lines",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-kds-team-ex-shopify-" + ConfigId("in-ecommerce-shopify-extractor-10697799") + ".product_options",
          destination: "product_options",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-kds-team-ex-shopify-" + ConfigId("in-ecommerce-shopify-extractor-10697799") + ".order",
          destination: "order",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-kds-team-ex-shopify-" + ConfigId("in-ecommerce-shopify-extractor-10697799") + ".product",
          destination: "product",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-kds-team-ex-shopify-" + ConfigId("in-ecommerce-shopify-extractor-10697799") + ".customer",
          destination: "customer",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-kds-team-ex-shopify-" + ConfigId("in-ecommerce-shopify-extractor-10697799") + ".order_discount_applications",
          destination: "order_discount_applications",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-kds-team-ex-shopify-" + ConfigId("in-ecommerce-shopify-extractor-10697799") + ".product_variant",
          destination: "product_variant",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-kds-team-ex-shopify-" + ConfigId("in-ecommerce-shopify-extractor-10697799") + ".order_fulfillments",
          destination: "order_fulfillments",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-kds-team-ex-shopify-" + ConfigId("in-ecommerce-shopify-extractor-10697799") + ".order_tax_lines",
          destination: "order_tax_lines",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-kds-team-ex-shopify-" + ConfigId("in-ecommerce-shopify-extractor-10697799") + ".product_images",
          destination: "product_images",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-kds-team-ex-shopify-" + ConfigId("in-ecommerce-shopify-extractor-10697799") + ".inventory_items",
          destination: "inventory_items",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-kds-team-ex-shopify-" + ConfigId("in-ecommerce-shopify-extractor-10697799") + ".locations",
          destination: "locations",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-kds-team-ex-shopify-" + ConfigId("in-ecommerce-shopify-extractor-10697799") + ".line_item",
          destination: "line_item",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-kds-team-ex-shopify-" + ConfigId("in-ecommerce-shopify-extractor-10697799") + ".inventory_levels",
          destination: "inventory_levels",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
      ],
    },
    output: {
      tables: [
        {
          destination: "out.c-ecommerce-bdm-" + ConfigId("in-ecommerce-shopify-extractor-10697799") + ".bdm_orders",
          source: "bdm_orders",
          primary_key: [
            "ORDER_ID",
          ],
        },
        {
          destination: "out.c-ecommerce-bdm-" + ConfigId("in-ecommerce-shopify-extractor-10697799") + ".bdm_order_lines",
          source: "bdm_order_lines",
          primary_key: [
            "ORDER_LINE_ID",
          ],
        },
        {
          destination: "out.c-ecommerce-bdm-" + ConfigId("in-ecommerce-shopify-extractor-10697799") + ".bdm_shipping_type",
          source: "bdm_shipping_type",
          primary_key: [
            "SHIPPING_TYPE_ID",
          ],
        },
        {
          destination: "out.c-ecommerce-bdm-" + ConfigId("in-ecommerce-shopify-extractor-10697799") + ".bdm_billing_type",
          source: "bdm_billing_type",
          primary_key: [
            "BILLING_TYPE_ID",
          ],
        },
        {
          destination: "out.c-ecommerce-bdm-" + ConfigId("in-ecommerce-shopify-extractor-10697799") + ".bdm_customers",
          source: "bdm_customers",
          primary_key: [
            "CUSTOMER_ACCOUNT_GUID",
          ],
        },
        {
          destination: "out.c-ecommerce-bdm-" + ConfigId("in-ecommerce-shopify-extractor-10697799") + ".bdm_products",
          source: "bdm_products",
          primary_key: [
            "PRODUCT_ID",
          ],
        },
        {
          destination: "out.c-ecommerce-bdm-" + ConfigId("in-ecommerce-shopify-extractor-10697799") + ".bdm_analyze_clv_by_order_count",
          source: "analyze_clv_by_order_count",
        },
        {
          destination: "out.c-ecommerce-bdm-" + ConfigId("in-ecommerce-shopify-extractor-10697799") + ".bdm_analyze_clv_by_time_from_previous_order",
          source: "analyze_clv_by_time_from_previous_order",
        },
        {
          destination: "out.c-ecommerce-bdm-" + ConfigId("in-ecommerce-shopify-extractor-10697799") + ".bdm_product_margin_over_time",
          source: "bdm_product_margin_over_time",
        },
        {
          destination: "out.c-ecommerce-bdm-" + ConfigId("in-ecommerce-shopify-extractor-10697799") + ".out_shop",
          source: "out_shopify",
        },
      ],
    },
  },
}
