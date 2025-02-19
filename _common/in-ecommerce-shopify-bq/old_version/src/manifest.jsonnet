{
  configurations: [
    {
      componentId: "kds-team.ex-shopify",
      id: ConfigId("in-ecommerce-shopify-extractor"),
      path: "extractor/kds-team.ex-shopify/in-ecommerce-shopify-extractor",
      rows: [],
    },
    {
      componentId: "keboola.orchestrator",
      id: ConfigId("in-ecommerce-shopify-orchestrator-bdm-creation"),
      path: "other/keboola.orchestrator/in-ecommerce-shopify-orchestrator-bdm-creation",
      rows: [],
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("in-ecommerce-shopify-transformation1-prepare-input-tables"),
      path: "transformation/keboola.snowflake-transformation/in-ecommerce-shopify-transformation1-prepare-input-tables",
      rows: [],
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("in-ecommerce-shopify-transformation2-data-preparation"),
      path: "transformation/keboola.snowflake-transformation/in-ecommerce-shopify-transformation2-data-preparation",
      rows: [],
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("in-ecommerce-shopify-transformation3-rfm-analysis"),
      path: "transformation/keboola.snowflake-transformation/in-ecommerce-shopify-transformation3-rfm-analysis",
      rows: [],
    },
  ],
}
