{
  parameters: {},
  storage: {
    output: {
      tables: [
        {
          source: "line_item_tax_lines",
          destination: "in.c-kds-team-ex-shopify-" + ConfigId("data-source-in-ecommerce-shopify") + ".line_item_tax_lines",
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
          source: "order_discount_applications",
          destination: "in.c-kds-team-ex-shopify-" + ConfigId("data-source-in-ecommerce-shopify") + ".order_discount_applications",
          primary_key: [
            "order_id",
            "row_nr",
          ],
          incremental: true,
          delete_where_column: "",
          delete_where_operator: "eq",
          delete_where_values: [],
        },
        {
          source: "order_fulfillments",
          destination: "in.c-kds-team-ex-shopify-" + ConfigId("data-source-in-ecommerce-shopify") + ".order_fulfillments",
          primary_key: [
            "id",
            "order_id",
          ],
          incremental: true,
          delete_where_column: "",
          delete_where_operator: "eq",
          delete_where_values: [],
        },
      ],
    },
  },
  runtime: {
    process_timeout: 7200
    },
}
