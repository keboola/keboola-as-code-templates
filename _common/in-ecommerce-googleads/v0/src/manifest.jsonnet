{
  configurations: [
    {
      componentId: "keboola.ex-google-ads",
      id: ConfigId("in-ecommerce-googleads-extractor-15228151"),
      path: "extractor/keboola.ex-google-ads/in-ecommerce-googleads-extractor-15228151",
      rows: [
        {
          id: ConfigRowId("campaign"),
          path: "rows/campaign",
        },
      ],
    },
    {
      componentId: "keboola.orchestrator",
      id: ConfigId("in-ecommerce-googleads-orchestration-bdm-creation-15228151"),
      path: "other/keboola.orchestrator/in-ecommerce-googleads-orchestration-bdm-creation-15228151",
      rows: [],
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("in-ecommerce-googleads-transformation-15228151"),
      path: "transformation/keboola.snowflake-transformation/in-ecommerce-googleads-transformation-15228151",
      rows: [],
    },
  ],
}
