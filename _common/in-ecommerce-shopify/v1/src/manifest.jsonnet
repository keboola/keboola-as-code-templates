{
  configurations: [
    {
      componentId: "kds-team.ex-shopify",
      id: ConfigId("data-source-in-ecommerce-shopify"),
      path: "extractor/kds-team.ex-shopify/data-source-in-ecommerce-shopify",
      rows: [],
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("transformation-1-prepare-input-tables-in-ecommerce-shopify"),
      path: "transformation/keboola.snowflake-transformation/transformation-1-prepare-input-tables-in-ecommerce-shopify",
      rows: [],
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("transformation-2-data-preparation-in-ecommerce-shopify"),
      path: "transformation/keboola.snowflake-transformation/transformation-2-data-preparation-in-ecommerce-shopify",
      rows: [],
    },
  ],
}
