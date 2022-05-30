{
  configurations: std.filter(function(v) v != null,[
    if InputIsAvailable("ex-bingads-dev-key") then
    {
      componentId: "esnerda.ex-bingads",
      id: ConfigId("keboola-marketingchannels-bingads-data-source"),
      path: "extractor/esnerda.ex-bingads/keboola-marketingchannels-bingads-data-source",
      rows: [],
    },
    if InputIsAvailable("ex-bingads-dev-key") then
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("keboola-marketingchannels-bingads-transformation"),
      path: "transformation/keboola.snowflake-transformation/keboola-marketingchannels-bingads-transformation",
      rows: [],
      metadata: { "KBC.configuration.folderName": "[MARKETINGCHANNELS]"}
    },
  ]),
}
