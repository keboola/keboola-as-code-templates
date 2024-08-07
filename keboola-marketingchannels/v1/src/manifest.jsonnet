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
    if InputIsAvailable("ga4-from") then
    {
      componentId: "keboola.ex-google-analytics-v4",
      id: ConfigId("in-marketingchannels-googleanalytics4-data-source"),
      path: "<common>/in-marketingchannels-googleanalytics4/extractor/keboola.ex-google-analytics-v4/in-marketingchannels-googleanalytics4-data-source",
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
    if InputIsAvailable("ga4-from") then
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("transformation-in-mkt-googleanalytics-ga4-test"),
      path: "<common>/in-marketingchannels-googleanalytics4/transformation/keboola.snowflake-transformation/transformation-in-mkt-googleanalytics4",
      rows: [],
      metadata: { "KBC.configuration.folderName": "[ADVERTISING PLATFORMS]"}
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
    if InputIsAvailable("ga-from") then
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("keboola-marketingchannels-googleanalytics-transformation"),
      path: "<common>/in-marketingchannels-googleanalytics/transformation/keboola.snowflake-transformation/keboola-marketingchannels-googleanalytics-transformation",
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
      path: "<common>/out-marketingchannels-bigquery/v0/writer/keboola.wr-google-bigquery-v2/keboola-marketingchannels-bigquery-data-destination",
      rows: std.filter(function(v) v != null,[
        if InputIsAvailable("ga-from") then
        {
          id: ConfigRowId("keywords-adgroup"),
          path: "rows/keywords-adgroup",
        },
        if InputIsAvailable("ga-from") then
        {
          id: ConfigRowId("online-marketing-traffic"),
          path: "rows/online-marketing-traffic",
        },
        if InputIsAvailable("ga-from") then
        {
          id: ConfigRowId("online-marketing-transactions"),
          path: "rows/online-marketing-transactions",
        },
        if InputIsAvailable("ga-from") == false then
        {
          id: ConfigRowId("online-marketing"),
          path: "rows/online-marketing",
        }
      ]),
    },
    if InputIsAvailable("google-sheet-id") then
    {
      componentId: "keboola.wr-google-sheets",
      id: ConfigId("keboola-marketingchannels-googlesheet-data-destination"),
      path: "<common>/out-marketingchannels-gsheet/v0/writer/keboola.wr-google-sheets/keboola-marketingchannels-googlesheet-data-destination",
      rows: [],
    },
    if InputIsAvailable("wr-snowflake-db-host") then
    {
      componentId: SnowflakeWriterComponentId(),
      id: ConfigId("keboola-marketingchannels-snowflake-data-destination"),
      path: "<common>/out-marketingchannels-snowflake/v0/writer/keboola.wr-snowflake/keboola-marketingchannels-snowflake-data-destination",
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
    if InputIsAvailable("wr-postgresql-db-hostname") then
    {
      componentId: "keboola.wr-db-pgsql",
      id: ConfigId("keboola-marketingchannels-postgresql-data-destination"),
      path: "<common>/out-marketingchannels-postgresql/v0/writer/keboola.wr-db-pgsql/keboola-marketingchannels-postgresql-data-destination",
      rows: std.filter(function(v) v != null,[
        if InputIsAvailable("ga-from") then
        {
          id: ConfigRowId("keywords-adgroup"),
          path: "rows/keywords-adgroup",
        },
        if InputIsAvailable("ga-from") then
        {
          id: ConfigRowId("online-marketing-traffic"),
          path: "rows/online-marketing-traffic",
        },
        if InputIsAvailable("ga-from") then
        {
          id: ConfigRowId("online-marketing-transactions"),
          path: "rows/online-marketing-transactions",
        },
        if InputIsAvailable("ga-from") == false then
        {
          id: ConfigRowId("online-marketing"),
          path: "rows/online-marketing",
        }
      ]),
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
