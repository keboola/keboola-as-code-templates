{
  configurations: [
    {
      componentId: "kds-team.ex-google-search-console",
      id: ConfigId("in-thoughtspot-googleanalytics-searchconsole-extractor"),
      path: "extractor/kds-team.ex-google-search-console/in-thoughtspot-googleanalytics-searchconsole-extractor",
      rows: [
        {
          id: ConfigRowId("google-search-console"),
          path: "rows/google-search-console",
        },
      ],
    },
    {
      componentId: "keboola.orchestrator",
      id: ConfigId("in-thoughtspot-googleanalytics-searchconsole-orchestration-bdm-creation"),
      path: "other/keboola.orchestrator/in-thoughtspot-googleanalytics-searchconsole-orchestration-bdm-creation",
      rows: [],
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("in-thoughtspot-googleanalytics-searchconsole-transformation"),
      path: "transformation/keboola.snowflake-transformation/in-thoughtspot-googleanalytics-searchconsole-transformation",
      rows: [],
    },
  ],
}
