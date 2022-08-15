{ mainConfig: {
    componentId: "keboola.orchestrator",
    id: ConfigId("keboola-analytics-googleanalytics-orchestration"),
  },
  configurations: std.filter(function(v) v != null, [
    {
      componentId: "keboola.orchestrator",
      id: ConfigId("keboola-analytics-googleanalytics-orchestration"),
      path: "other/keboola.orchestrator/keboola-analytics-googleanalytics-orchestration",
      rows: [],
    },
    {
      componentId: "keboola.ex-google-analytics-v4",
      id: ConfigId("in-googleanalytics-extractor"),
      path: "<common>/in-googleanalytics/v0/src/extractor/keboola.ex-google-analytics-v4/in-googleanalytics-extractor",
      rows: [],
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("in-googleanalytics-transformation"),
      path: "<common>/in-googleanalytics/v0/src/transformation/keboola.snowflake-transformation/in-googleanalytics-transformation",
      rows: [],
      metadata: { "KBC.configuration.folderName": "[ANALYTICS-GOOGLEANALYTICS]"}
    },
    if InputIsAvailable("google-sheet-id") then
    {
      componentId: "keboola.wr-google-sheets",
      id: ConfigId("data-destination-out-googleanalytics-gsheet"),
      path: "<common>/out-googleanalytics-gsheet/v0/src/writer/keboola.wr-google-sheets/data-destination-out-googleanalytics-gsheet",
      rows: [],
    },
    if InputIsAvailable("gsc-domain") then
    {
      componentId: "kds-team.ex-google-search-console",
      id: ConfigId("in-googleanalytics-searchconsole-extractor"),
      path: "<common>/in-googleanalytics-searchconsole/v0/src/extractor/kds-team.ex-google-search-console/in-googleanalytics-searchconsole-extractor",
      rows: [
        {
          id: ConfigRowId("google-search-console"),
          path: "rows/google-search-console",
        },
      ],
    },
    if InputIsAvailable("gsc-domain") then
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("in-googleanalytics-searchconsole-transformation"),
      path: "<common>/in-googleanalytics-searchconsole/v0/src/transformation/keboola.snowflake-transformation/in-googleanalytics-searchconsole-transformation",
      rows: [],
      metadata: { "KBC.configuration.folderName": "[ANALYTICS-GOOGLEANALYTICS]"}
    },
    ],)
}
