{
  configurations: [
    {
      componentId: "keboola.orchestrator",
      id: ConfigId("out-ecommerce-snowflake-marketing-orchestration-bdm-usage-6031001"),
      path: "other/keboola.orchestrator/out-ecommerce-snowflake-marketing-orchestration-bdm-usage-6031001",
      rows: [],
    },
    {
      componentId: "keboola.wr-snowflake-blob-storage",
      id: ConfigId("out-ecommerce-snowflake-marketing-writer-6031001"),
      path: "writer/keboola.wr-snowflake-blob-storage/out-ecommerce-snowflake-marketing-writer-6031001",
      rows: [
        {
          id: ConfigRowId("bdm-marketing-campaign-costs"),
          path: "rows/bdm-marketing-campaign-costs",
        },
        {
          id: ConfigRowId("bdm-marketing-campaign-costs-monthly"),
          path: "rows/bdm-marketing-campaign-costs-monthly",
        },
      ],
    },
  ],
}
