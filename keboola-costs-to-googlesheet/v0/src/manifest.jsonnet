{ mainConfig: {
    componentId: "keboola.orchestrator",
    id: ConfigId("flow-keboola-costs"),
  },
  configurations: [
    {
      componentId: "keboola.orchestrator",
      id: ConfigId("flow-keboola-costs"),
      path: "other/keboola.orchestrator/flow-keboola-costs",
      rows: [],
    },
    {
      componentId: "keboola.ex-telemetry-data",
      id: ConfigId("telemetry-keboola-costs"),
      path: "<common>/in-keboola-costs/extractor/keboola.ex-telemetry-data/telemetry-keboola-costs",
      rows: [],
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("transformation-keboola-costs"),
      path: "<common>/in-keboola-costs/transformation/keboola.snowflake-transformation/transformation-keboola-costs",
      rows: [],
    },
    {
      componentId: "keboola.wr-google-sheets",
      id: ConfigId("google-sheets-keboola-costs"),
      path: "<common>/out-keboola-costs-gsheet/writer/keboola.wr-google-sheets/google-sheets-keboola-costs",
      rows: [],
    },
  ],
}
