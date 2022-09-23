{ mainConfig: {
    componentId: "keboola.orchestrator",
    id: ConfigId("keboola-marketingchannels-flow"),
  },
  configurations: std.filter(function(v) v != null,[
    {
      componentId: "keboola.orchestrator",
      id: ConfigId("keboola-marketingchannels-flow"),
      path: "other/keboola.orchestrator/keboola-marketingchannels-flow",
      rows: [],
    },
    if InputIsAvailable("oauth-facebookads") then
    {
      componentId: "keboola.ex-facebook-ads",
      id: ConfigId("keboola-marketingchannels-facebook-data-source"),
      path: "<common>/in-marketingchannels-facebookads/extractor/keboola.ex-facebook-ads/keboola-marketingchannels-facebook-data-source",
      rows: [],
    },
    if InputIsAvailable("ex-bingads-dev-key") then
    {
      componentId: "esnerda.ex-bingads",
      id: ConfigId("keboola-marketingchannels-bingads-data-source"),
      path: "<common>/in-marketingchannels-bingads/extractor/esnerda.ex-bingads/keboola-marketingchannels-bingads-data-source",
      rows: [],
    },
    if InputIsAvailable("oauth-googleads") then
    {
      componentId: "keboola.ex-google-ads",
      id: ConfigId("keboola-marketingchannels-googleads-data-source"),
      path: "<common>/in-marketingchannels-googleads/extractor/keboola.ex-google-ads/keboola-marketingchannels-googleads-data-source",
      rows: [],
    },
    if InputIsAvailable("ga-from") then
    {
      componentId: "keboola.ex-google-analytics-v4",
      id: ConfigId("keboola-marketingchannels-googleanalytics-data-source"),
      path: "<common>/in-marketingchannels-googleanalytics/extractor/keboola.ex-google-analytics-v4/keboola-marketingchannels-googleanalytics-data-source",
      rows: [],
    },
    if InputIsAvailable("ex-linkedin-start-day") then
    {
      componentId: "leochan.ex-linkedin",
      id: ConfigId("keboola-marketingchannels-linkedin-data-source"),
      path: "<common>/in-marketingchannels-linkedinads/extractor/leochan.ex-linkedin/keboola-marketingchannels-linkedin-data-source",
      rows: [],
    },
    if InputIsAvailable("oauth-facebookads") then
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("keboola-marketingchannels-facebookads-transformation"),
      path: "<common>/in-marketingchannels-facebookads/transformation/keboola.snowflake-transformation/keboola-marketingchannels-facebookads-transformation",
      rows: [],
      metadata: { "KBC.configuration.folderName": "[MARKETINGCHANNELS]"}
    },
    if InputIsAvailable("ex-bingads-dev-key") then
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("keboola-marketingchannels-bingads-transformation"),
      path: "<common>/in-marketingchannels-bingads/transformation/keboola.snowflake-transformation/keboola-marketingchannels-bingads-transformation",
      rows: [],
      metadata: { "KBC.configuration.folderName": "[MARKETINGCHANNELS]"}
    },
    if InputIsAvailable("oauth-googleads") then
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("keboola-marketingchannels-googleads-transformation"),
      path: "<common>/in-marketingchannels-googleads/transformation/keboola.snowflake-transformation/keboola-marketingchannels-googleads-transformation",
      rows: [],
      metadata: { "KBC.configuration.folderName": "[MARKETINGCHANNELS]"}
    },
    if InputIsAvailable("ga-from") then
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("keboola-marketingchannels-googleanalytics-transformation"),
      path: "<common>/in-marketingchannels-googleanalytics/transformation/keboola.snowflake-transformation/keboola-marketingchannels-googleanalytics-transformation",
      rows: [],
      metadata: { "KBC.configuration.folderName": "[MARKETINGCHANNELS]"}
    },
    if InputIsAvailable("ex-linkedin-start-day") then
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("keboola-marketingchannels-linkedin-transformation"),
      path: "<common>/in-marketingchannels-linkedinads/transformation/keboola.snowflake-transformation/keboola-marketingchannels-linkedin-transformation",
      rows: [],
      metadata: { "KBC.configuration.folderName": "[MARKETINGCHANNELS]"}
    },
    {
      componentId: SnowflakeWriterComponentId(),
      id: ConfigId("keboola-marketingchannels-snowflake-data-destination"),
      path: "<common>/out-marketingchannels-snowflake/writer/keboola.wr-snowflake/keboola-marketingchannels-snowflake-data-destination",
      rows: std.filter(function(v) v != null,[
        if InputIsAvailable("ga-from") then
        {
          id: ConfigRowId("keywords-adgroup-001"),
          path: "rows/keywords-adgroup-001",
        },
        if InputIsAvailable("ga-from") then
        {
          id: ConfigRowId("online-marketing-traffic-001"),
          path: "rows/online-marketing-traffic-001",
        },
        if InputIsAvailable("ga-from") then
        {
          id: ConfigRowId("online-marketing-transactions-001"),
          path: "rows/online-marketing-transactions-001",
        },
        if InputIsAvailable("ga-from") == false then
        {
          id: ConfigRowId("online-marketing"),
          path: "rows/online-marketing",
        },
      ]),
    },
  ]),
}
