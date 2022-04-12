{
  configurations: [
    {
      componentId: "kds-team.ex-shoptet-permalink",
      id: ConfigId("in-ecommerce-shoptet-extractor"),
      path: "extractor/kds-team.ex-shoptet-permalink/in-ecommerce-shoptet-extractor",
      rows: [],
    },
    {
      componentId: "keboola.orchestrator",
      id: ConfigId("in-ecommerce-shoptet-orchestration-bdm-creation"),
      path: "other/keboola.orchestrator/in-ecommerce-shoptet-orchestration-bdm-creation",
      rows: [],
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("in-ecommerce-shoptet-transformation1-data-preparation"),
      path: "transformation/keboola.snowflake-transformation/in-ecommerce-shoptet-transformation1-data-preparation",
      rows: [],
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("in-ecommerce-shoptet-transformation2-rfm-analysis"),
      path: "transformation/keboola.snowflake-transformation/in-ecommerce-shoptet-transformation2-rfm-analysis",
      rows: [],
    },
  ],
}
