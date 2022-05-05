{
  configurations: [
    {
      componentId: "keboola.ex-google-analytics-v4",
      id: ConfigId("in-googleanalytics-extractor"),
      path: "extractor/keboola.ex-google-analytics-v4/in-googleanalytics-extractor",
      rows: [],
    },
    {
      componentId: "keboola.orchestrator",
      id: ConfigId("in-googleanalytics-orchestration-bdm-creation"),
      path: "other/keboola.orchestrator/in-googleanalytics-orchestration-bdm-creation",
      rows: [],
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("in-googleanalytics-transformation"),
      path: "transformation/keboola.snowflake-transformation/in-googleanalytics-transformation",
      rows: [],
    },
  ],
}
