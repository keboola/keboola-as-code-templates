{
  configurations: [
    {
      componentId: "keboola.ex-facebook-ads",
      id: ConfigId("in-ecommerce-facebook-extractor"),
      path: "extractor/keboola.ex-facebook-ads/in-ecommerce-facebook-extractor",
      rows: [],
    },
    {
      componentId: "keboola.orchestrator",
      id: ConfigId("in-ecommerce-facebook-orchestration-bdm-creation"),
      path: "other/keboola.orchestrator/in-ecommerce-facebook-orchestration-bdm-creation",
      rows: [],
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("in-ecommerce-facebook-transformation"),
      path: "transformation/keboola.snowflake-transformation/in-ecommerce-facebook-transformation",
      rows: [],
    },
  ],
}
