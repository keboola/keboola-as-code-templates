{
  configurations: [
    {
      componentId: "keboola.ex-google-analytics-v4",
      id: ConfigId("in-marketingchannels-googleanalytics4-data-source"),
      path: "extractor/keboola.ex-google-analytics-v4/in-marketingchannels-googleanalytics4-data-source",
      rows: [
        {
          id: ConfigRowId("ga4-basic-sessions"),
          path: "rows/ga4-basic-sessions",
        },
        {
          id: ConfigRowId("ga4-basic-transactions"),
          path: "rows/ga4-basic-transactions",
        },
      ],
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("transformation-in-mkt-googleanalytics4-ga4"),
      path: "transformation/keboola.snowflake-transformation/transformation-in-mkt-googleanalytics4",
      rows: [],
    },
  ],
}
