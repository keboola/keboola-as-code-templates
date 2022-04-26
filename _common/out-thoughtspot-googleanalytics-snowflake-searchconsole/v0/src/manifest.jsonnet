{
  configurations: [
    {
      componentId: "keboola.orchestrator",
      id: ConfigId("out-thoughtspot-googleanalytics-snowflake-searchconsole-orchestration-bdm-usage-15471164"),
      path: "other/keboola.orchestrator/out-thoughtspot-googleanalytics-bigquery-searchconsole-orchestration-bdm-usage-15471164",
      rows: [],
    },
    {
      componentId: "keboola.wr-snowflake-blob-storage",
      id: ConfigId("out-thoughtspot-googleanalytics-snowflake-searchconsole-writer-15471164"),
      path: "writer/keboola.wr-snowflake-blob-storage/out-thoughtspot-googleanalytics-snowflake-searchconsole-writer-15471164",
      rows: [
        {
          id: ConfigRowId("gsc_ranking"),
          path: "rows/gsc_ranking",
        },
      ],
    },
  ],
}
