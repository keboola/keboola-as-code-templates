{
  parameters: {},
  storage: {
    output: {
      tables: [
        {
          delete_where_column: "",
          delete_where_operator: "eq",
          delete_where_values: [],
          destination: "in.c-demo-kds-team-ex-shopify-" + ConfigId("import-shopify-demo-data") + ".order-tax-lines",
          incremental: true,
          primary_key: [
            "order_id",
            "row_nr",
          ],
          source: "order_tax_lines",
        },
        {
          delete_where_column: "",
          delete_where_operator: "eq",
          delete_where_values: [],
          destination: "in.c-demo-kds-team-ex-shopify-" + ConfigId("import-shopify-demo-data") + ".line-item-tax-lines",
          incremental: true,
          primary_key: [
            "row_nr",
            "line_item_id",
          ],
          source: "line_item_tax_lines",
        },
        {
          delete_where_column: "",
          delete_where_operator: "eq",
          delete_where_values: [],
          destination: "in.c-demo-kds-team-ex-shopify-" + ConfigId("import-shopify-demo-data") + ".order-discount-applications",
          incremental: true,
          primary_key: [
            "order_id",
            "row_nr",
          ],
          source: "order_discount_applications",
        },
        {
          delete_where_column: "",
          delete_where_operator: "eq",
          delete_where_values: [],
          destination: "in.c-demo-kds-team-ex-shopify-" + ConfigId("import-shopify-demo-data") + ".order-fulfillments",
          incremental: true,
          primary_key: [
            "id",
            "order_id",
          ],
          source: "order_fulfillments",
        },
      ],
    },
  },
}
