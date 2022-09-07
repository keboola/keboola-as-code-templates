{
  parameters: {},
  storage: {
    output: {
      tables: [
        {
          destination: "in.c-kds-team-ex-shopify-" + ConfigId("in-ecommerce-shopify-extractor") + ".order_tax_lines",
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
          destination: "in.c-kds-team-ex-shopify-" + ConfigId("in-ecommerce-shopify-extractor") + ".line_item_tax_lines",
          source: "line_item_tax_lines",
          primary_key: [],
          incremental: true,
          delete_where_column: "",
          delete_where_operator: "eq",
          delete_where_values: [],
        },
        {
          destination: "in.c-kds-team-ex-shopify-" + ConfigId("in-ecommerce-shopify-extractor") + ".order_discount_applications",
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
          destination: "in.c-kds-team-ex-shopify-" + ConfigId("in-ecommerce-shopify-extractor") + ".order_fulfillments",
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
