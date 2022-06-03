{
  configurations: std.filter(function(v) v != null,[
    if InputIsAvailable("ga-from") then
    {
      componentId: "keboola.ex-google-analytics-v4",
      id: ConfigId("keboola-marketingchannels-googleanalytics-data-source"),
      path: "extractor/keboola.ex-google-analytics-v4/keboola-marketingchannels-googleanalytics-data-source",
      rows: [
        {
          id: ConfigRowId("mkt-ga-basic-sessions"),
          path: "rows/mkt-ga-basic-sessions",
        },
        {
          id: ConfigRowId("mkt-ga-basic-transactions"),
          path: "rows/mkt-ga-basic-transactions",
        },
      ],
    },
    if InputIsAvailable("ga-from") then
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("keboola-marketingchannels-googleanalytics-transformation"),
      path: "transformation/keboola.snowflake-transformation/keboola-marketingchannels-googleanalytics-transformation",
      rows: [],
      metadata: { "KBC.configuration.folderName": "[MARKETINGCHANNELS]"}
    },
  ]),
}
