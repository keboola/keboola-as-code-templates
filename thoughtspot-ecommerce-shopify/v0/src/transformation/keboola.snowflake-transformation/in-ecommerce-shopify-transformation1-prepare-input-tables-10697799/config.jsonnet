{
  parameters: {},
  storage: {
    output: {
      tables: [
        {
          destination: "in.kds-team-ex-shopify-" + ConfigId("in-ecommerce-shopify-extractor-10697799") + ".order_tax_lines",
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
          destination: "in.kds-team-ex-shopify-" + ConfigId("in-ecommerce-shopify-extractor-10697799") + ".line_item_tax_lines",
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
          destination: "in.kds-team-ex-shopify-" + ConfigId("in-ecommerce-shopify-extractor-10697799") + ".order_discount_applications",
          source: "order_discount_applications",
          incremental: false,
          delete_where_column: "",
          delete_where_operator: "eq",
          delete_where_values: [],
          primary_key: [],
        },
        {
          destination: "in.kds-team-ex-shopify-" + ConfigId("in-ecommerce-shopify-extractor-10697799") + ".order_fulfillments",
          source: "order_fulfillments",
          incremental: false,
          delete_where_column: "",
          delete_where_operator: "eq",
          delete_where_values: [],
          primary_key: [],
        },
      ],
    },
  },
}
