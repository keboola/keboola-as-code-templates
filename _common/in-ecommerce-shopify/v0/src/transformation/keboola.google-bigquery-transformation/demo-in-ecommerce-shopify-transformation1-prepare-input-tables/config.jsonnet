{
  parameters: {},
  storage: {
    output: {
      tables: [
        {
          destination: "in.c-demo-kds-team-ex-shopify-" + ConfigId("in-ecommerce-shopify-extractor") + ".order-tax-lines",
          source: "order_tax_lines",
          incremental: true,
          delete_where_column: "",
          delete_where_operator: "eq",
          delete_where_values: [],
          primary_key: [
            "order_id",
            "row_nr",
          ],
        },
        {
          destination: "in.c-demo-kds-team-ex-shopify-" + ConfigId("in-ecommerce-shopify-extractor") + ".line-item-tax-lines",
          source: "line_item_tax_lines",
          primary_key: [
            "row_nr",
            "line_item_id",
          ],
          incremental: true,
          delete_where_column: "",
          delete_where_operator: "eq",
          delete_where_values: [],
        },
        {
          destination: "in.c-demo-kds-team-ex-shopify-" + ConfigId("in-ecommerce-shopify-extractor") + ".order-discount-applications",
          source: "order_discount_applications",
          incremental: true,
          delete_where_column: "",
          delete_where_operator: "eq",
          delete_where_values: [],
          primary_key: [
            "order_id",
            "row_nr",
          ],
        },
        {
          destination: "in.c-demo-kds-team-ex-shopify-" + ConfigId("in-ecommerce-shopify-extractor") + ".order-fulfillments",
          source: "order_fulfillments",
          incremental: true,
          delete_where_column: "",
          delete_where_operator: "eq",
          delete_where_values: [],
          primary_key: [
            "id",
            "order_id",
          ],
        },
      ],
    },
  },
}
