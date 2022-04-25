{
  configurations: [
    {
      componentId: "keboola.orchestrator",
      id: ConfigId("out-thoughtspot-googleanalytics-bigquery-searchconsole-orchestration-bdm-usage-16240909"),
      path: "other/keboola.orchestrator/out-thoughtspot-googleanalytics-bigquery-searchconsole-orchestration-bdm-usage-16240909",
      rows: [],
    },
    {
      componentId: "keboola.wr-google-bigquery-v2",
      id: ConfigId("out-thoughtspot-googleanalytics-bigquery-searchconsole-writer-16240909"),
      path: "writer/keboola.wr-google-bigquery-v2/out-thoughtspot-googleanalytics-bigquery-searchconsole-writer-16240909",
      rows: [
        {
          id: ConfigRowId("gsc_ranking"),
          path: "rows/gsc_ranking",
        },
      ],
    },
  ],
}
