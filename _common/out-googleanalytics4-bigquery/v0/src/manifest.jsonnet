{
  configurations: [
    {
      componentId: "keboola.wr-google-bigquery-v2",
      id: ConfigId("data-destination-out-googleanalytics4-bigquery"),
      path: "writer/keboola.wr-google-bigquery-v2/data-destination-out-googleanalytics4-bigquery",
      rows: [
        {
          id: ConfigRowId("ga4-ad-analytics"),
          path: "rows/ga4-ad-analytics",
        },
        {
          id: ConfigRowId("ga4-audience"),
          path: "rows/ga4-audience",
        },
        {
          id: ConfigRowId("ga4-demographic-audience"),
          path: "rows/ga4-demographic-audience",
        },
        {
          id: ConfigRowId("ga4-event"),
          path: "rows/ga4-event",
        },
        {
          id: ConfigRowId("ga4-geo-audience"),
          path: "rows/ga4-geo-audience",
        },
        {
          id: ConfigRowId("ga4-page-behaviour"),
          path: "rows/ga4-page-behaviour",
        },
        {
          id: ConfigRowId("ga4-traffic-source"),
          path: "rows/ga4-traffic-source",
        },
        {
          id: ConfigRowId("gsc_ranking"),
          path: "rows/gsc_ranking",
        },
      ],
    },
  ],
}
