{
  parameters: {},
  storage: {
    input: {
      tables: [
        {
          source: "out.c-ecommerce-bdm-" + ConfigId("in-ecommerce-shopify-extractor-10697799") + ".bdm_orders",
          destination: "bdm_orders",
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
          destination: "out.c-ecommerce-bdm-" + ConfigId("in-ecommerce-shopify-extractor-10697799") + ".bdm_rfm",
          source: "RFM_FINAL",
        },
      ],
    },
  },
}
