{
  configurations: [
    {
      componentId: "keboola.orchestrator",
      id: ConfigId("out-googleanalytics-bigquery-orchestration-bdm-usage-15471164"),
      path: "other/keboola.orchestrator/out-googleanalytics-bigquery-orchestration-bdm-usage-15471164",
      rows: [],
    },
    {
      componentId: "keboola.wr-google-bigquery-v2",
      id: ConfigId("out-googleanalytics-bigquery-writer-15471164"),
      path: "writer/keboola.wr-google-bigquery-v2/out-googleanalytics-bigquery-writer-15471164",
      rows: [
        {
          id: ConfigRowId("ga-ad-analytics"),
          path: "rows/ga-ad-analytics",
        },
        {
          id: ConfigRowId("ga-demographic-audience"),
          path: "rows/ga-demographic-audience",
        },
        {
          id: ConfigRowId("ga-geo-audience"),
          path: "rows/ga-geo-audience",
        },
        {
          id: ConfigRowId("ga-page-behaviour"),
          path: "rows/ga-page-behaviour",
        },
        {
          id: ConfigRowId("ga-site-statistics"),
          path: "rows/ga-site-statistics",
        },
        {
          id: ConfigRowId("ga-traffic-source"),
          path: "rows/ga-traffic-source",
        },
        {
          id: ConfigRowId("gsc_ranking"),
          path: "rows/gsc_ranking",
        },
      ],
    },
  ],
}
