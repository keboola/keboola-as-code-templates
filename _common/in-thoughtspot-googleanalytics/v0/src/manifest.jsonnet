{
  configurations: [
    {
      componentId: "keboola.ex-google-analytics-v4",
      id: ConfigId("in-thoughtspot-gaa-extractor"),
      path: "extractor/keboola.ex-google-analytics-v4/in-thoughtspot-gaa-extractor",
      rows: [],
    },
    {
      componentId: "keboola.orchestrator",
      id: ConfigId("in-thoughtspot-gaa-orchestration-bdm-creation"),
      path: "other/keboola.orchestrator/in-thoughtspot-gaa-orchestration-bdm-creation",
      rows: [],
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("in-thoughtspot-gaa-transformation"),
      path: "transformation/keboola.snowflake-transformation/in-thoughtspot-gaa-transformation",
      rows: [],
    },
  ],
}
