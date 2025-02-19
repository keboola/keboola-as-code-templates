{
  configurations: [
    {
      componentId: "kds-team.ex-bigcommerce",
      id: ConfigId("data-source-in-ecommerce-bigcommerce"),
      path: "extractor/kds-team.ex-bigcommerce/data-source-in-ecommerce-bigcommerce",
      rows: [
        {
          id: ConfigRowId("brands"),
          path: "rows/brands",
        },
        {
          id: ConfigRowId("customers"),
          path: "rows/customers",
        },
        {
          id: ConfigRowId("orders"),
          path: "rows/orders",
        },
        {
          id: ConfigRowId("products"),
          path: "rows/products",
        },
      ],
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("transformation-in-ecommerce-bigcommerce"),
      path: "transformation/keboola.snowflake-transformation/transformation-in-ecommerce-bigcommerce",
      rows: [],
    },
  ],
}
