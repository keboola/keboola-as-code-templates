{ mainConfig: {
    componentId: "keboola.orchestrator",
    id: ConfigId("flow-keboola-costs"),
  },
  configurations: std.filter(function(v) v != null,[
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
    if InputIsAvailable("google-sheet-id") then
    {
      componentId: "keboola.wr-google-sheets",
      id: ConfigId("google-sheets-keboola-costs"),
      path: "<common>/out-keboola-costs-gsheet/writer/keboola.wr-google-sheets/google-sheets-keboola-costs",
      rows: [],
    },
    if InputIsAvailable("wr-snowflake-blob-storage-db-host") then
    {
      componentId: "keboola.wr-snowflake-blob-storage",
      id: ConfigId("snowflake-keboola-costs"),
      path: "<common>/out-keboola-costs-snowflake/writer/keboola.wr-snowflake-blob-storage/snowflake-keboola-costs",
      rows: [
        {
          id: ConfigRowId("components"),
          path: "rows/components",
        },
        {
          id: ConfigRowId("configurations"),
          path: "rows/configurations",
        },
        {
          id: ConfigRowId("configurations-versions"),
          path: "rows/configurations-versions",
        },
        {
          id: ConfigRowId("jobs"),
          path: "rows/jobs",
        },
        {
          id: ConfigRowId("kbc-usage-metrics-values"),
          path: "rows/kbc-usage-metrics-values",
        },
        {
          id: ConfigRowId("projects"),
          path: "rows/projects",
        },
        {
          id: ConfigRowId("snowflake-statistics"),
          path: "rows/snowflake-statistics",
        },
      ],
    },
    if InputIsAvailable("wr-google-bigquery-v2-service-account-private-key") then
    {
      componentId: "keboola.wr-google-bigquery-v2",
      id: ConfigId("data-destination-out-keboola-costs-bigquery"),
      path: "<common>/out-keboola-costs-bigquery/v0/src/writer/keboola.wr-google-bigquery-v2/data-destination-out-keboola-costs-bigquery",
      rows: [
        {
          id: ConfigRowId("components"),
          path: "rows/components",
        },
        {
          id: ConfigRowId("configurations"),
          path: "rows/configurations",
        },
        {
          id: ConfigRowId("configurations-versions"),
          path: "rows/configurations-versions",
        },
        {
          id: ConfigRowId("jobs"),
          path: "rows/jobs",
        },
        {
          id: ConfigRowId("kbc-usage-metrics-values"),
          path: "rows/kbc-usage-metrics-values",
        },
        {
          id: ConfigRowId("projects"),
          path: "rows/projects",
        },
        {
          id: ConfigRowId("snowflake-statistics"),
          path: "rows/snowflake-statistics",
        },
      ],
    },
  ],)
}
