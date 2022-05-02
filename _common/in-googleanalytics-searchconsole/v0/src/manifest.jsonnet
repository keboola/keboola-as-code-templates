{
  configurations: [
    {
      componentId: "kds-team.ex-google-search-console",
      id: ConfigId("in-thoughtspot-googleanalytics-searchconsole-extractor-16240909"),
      path: "extractor/kds-team.ex-google-search-console/in-thoughtspot-googleanalytics-searchconsole-extractor-16240909",
      rows: [
        {
          id: ConfigRowId("google-search-console"),
          path: "rows/google-search-console",
        },
      ],
    },
    {
      componentId: "keboola.orchestrator",
      id: ConfigId("in-thoughtspot-googleanalytics-searchconsole-orchestration-bdm-creation-16240909"),
      path: "other/keboola.orchestrator/in-thoughtspot-googleanalytics-searchconsole-orchestration-bdm-creation-16240909",
      rows: [],
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("in-thoughtspot-googleanalytics-searchconsole-transformation-16240909"),
      path: "transformation/keboola.snowflake-transformation/in-thoughtspot-googleanalytics-searchconsole-transformation-16240909",
      rows: [],
    },
  ],
}
