{
  configurations: std.filter(function(v) v != null,[
    
    if InputIsAvailable("ex-linkedin-start-day") then
    {
      componentId: "leochan.ex-linkedin",
      id: ConfigId("keboola-marketingchannels-linkedin-data-source"),
      path: "extractor/leochan.ex-linkedin/keboola-marketingchannels-linkedin-data-source",
      rows: [],
    },
    if InputIsAvailable("ex-linkedin-start-day") then
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("keboola-marketingchannels-linkedin-transformation"),
      path: "transformation/keboola.snowflake-transformation/keboola-marketingchannels-linkedin-transformation",
      rows: [],
      metadata: { "KBC.configuration.folderName": "[MARKETINGCHANNELS]"}
    },
  ]),
}
