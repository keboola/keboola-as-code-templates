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
    if InputIsAvailable("ex-bingads-account-id") then
    {
      componentId: "kds-team.ex-bing-ads",
      id: ConfigId("keboola-marketingchannels-bingads-data-source"),
      path: "<common>/in-marketingchannels-bingads/extractor/kds-team.ex-bing-ads/keboola-marketingchannels-bingads-data-source",
      rows: [
        {
          id: ConfigRowId("ad-group-performance"),
          path: "rows/ad-group-performance"
        },
        {
          id: ConfigRowId("campaigns"),
          path: "rows/campaigns"
        },
      ],
    },
    if InputIsAvailable("oauth-googleads") then
    {
      componentId: "keboola.ex-google-ads",
      id: ConfigId("keboola-marketingchannels-googleads-data-source"),
      path: "<common>/in-marketingchannels-googleads/extractor/keboola.ex-google-ads/keboola-marketingchannels-googleads-data-source",
      rows: [
        {
          id: ConfigRowId("ad-groups"),
          path: "rows/ad-groups",
        },
        {
          id: ConfigRowId("url-adwords"),
          path: "rows/url-adwords",
        },
      ],
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
      metadata: { "KBC.configuration.folderName": "[ADVERTISING PLATFORMS]"}
    },
    if InputIsAvailable("ex-bingads-account-id") then
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("keboola-marketingchannels-bingads-transformation"),
      path: "<common>/in-marketingchannels-bingads/transformation/keboola.snowflake-transformation/keboola-marketingchannels-bingads-transformation",
      rows: [],
      metadata: { "KBC.configuration.folderName": "[ADVERTISING PLATFORMS]"}
    },
    if InputIsAvailable("oauth-googleads") then
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("keboola-marketingchannels-googleads-transformation"),
      path: "<common>/in-marketingchannels-googleads/transformation/keboola.snowflake-transformation/keboola-marketingchannels-googleads-transformation",
      rows: [],
      metadata: { "KBC.configuration.folderName": "[ADVERTISING PLATFORMS]"}
    },
    if InputIsAvailable("ex-linkedin-start-day") then
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("keboola-marketingchannels-linkedin-transformation"),
      path: "<common>/in-marketingchannels-linkedinads/transformation/keboola.snowflake-transformation/keboola-marketingchannels-linkedin-transformation",
      rows: [],
      metadata: { "KBC.configuration.folderName": "[ADVERTISING PLATFORMS]"}
    },
    if InputIsAvailable("wr-google-bigquery-v2-service-account-private-key") then
    {
      componentId: "keboola.wr-google-bigquery-v2",
      id: ConfigId("keboola-marketingchannels-bigquery-data-destination"),
      path: "<common>/out-marketingchannels-bigquery/v2/writer/keboola.wr-google-bigquery-v2/keboola-marketingchannels-bigquery-data-destination",
      rows: [
        {
          id: ConfigRowId("online-marketing"),
          path: "rows/online-marketing",
        }
      ],
    },
    if InputIsAvailable("google-sheet-id") then
    {
      componentId: "keboola.wr-google-sheets",
      id: ConfigId("keboola-marketingchannels-googlesheet-data-destination"),
      path: "<common>/out-marketingchannels-gsheet/v2/writer/keboola.wr-google-sheets/keboola-marketingchannels-googlesheet-data-destination",
      rows: [],
    },
    if InputIsAvailable("wr-snowflake-db-host") then
    {
      componentId: SnowflakeWriterComponentId(),
      id: ConfigId("keboola-marketingchannels-snowflake-data-destination"),
      path: "<common>/out-marketingchannels-snowflake/v2/writer/keboola.wr-snowflake/keboola-marketingchannels-snowflake-data-destination",
      rows: [     
        {
          id: ConfigRowId("online-marketing"),
          path: "rows/online-marketing",
        },
      ],
    },
    if InputIsAvailable("wr-postgresql-db-hostname") then
    {
      componentId: "keboola.wr-db-pgsql",
      id: ConfigId("keboola-marketingchannels-postgresql-data-destination"),
      path: "<common>/out-marketingchannels-postgresql/v2/writer/keboola.wr-db-pgsql/keboola-marketingchannels-postgresql-data-destination",
      rows: [
        {
          id: ConfigRowId("online-marketing"),
          path: "rows/online-marketing",
        }
      ],
    },
    if InputIsAvailable("data-apps") then
    {
      componentId: "keboola.data-apps",
      id: ConfigId("marketing-dashboard-data-app"),
      path: "app/keboola.data-apps/marketing-dashboard-data-app",
      rows: [],
    },
  ]),
}
