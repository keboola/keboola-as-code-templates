{ mainConfig: {
    componentId: "keboola.orchestrator",
    id: ConfigId("google-analytics-comparison-ua-ga4-comparison-app"),
  },
  configurations: std.filter(function(v) v != null,[
    {
      componentId: "keboola.data-apps",
      id: ConfigId("ua-vs-ga4-comparison-app-ua-ga4-comparison-app"),
      path: "app/keboola.data-apps/ua-vs-ga4-comparison-app-ua-ga4-comparison-app",
      rows: [],
    },
    if InputIsAvailable("oauth-googleanalytics4") then
    {
      componentId: "keboola.ex-google-analytics-v4",
      id: ConfigId("ga4-data-ua-ga4-comparison-app"),
      path: "extractor/keboola.ex-google-analytics-v4/ga4-data-ua-ga4-comparison-app",
      rows: [
        {
          id: ConfigRowId("ga4api"),
          path: "rows/ga4api",
        },
        {
          id: ConfigRowId("ga4api-transactions"),
          path: "rows/ga4api-transactions",
        },
      ],
    },
    {
      componentId: "keboola.ex-google-analytics-v4",
      id: ConfigId("ua-data-ua-ga4-comparison-app"),
      path: "extractor/keboola.ex-google-analytics-v4/ua-data-ua-ga4-comparison-app",
      rows: [
        {
          id: ConfigRowId("universal-analytics"),
          path: "rows/universal-analytics",
        },
      ],
    },
    if InputIsAvailable("ex-google-bigquery-v2-service-account-private-key") then
    {
      componentId: "keboola.ex-google-bigquery-v2",
      id: ConfigId("ga4-raw-events-ua-ga4-comparison-app"),
      path: "extractor/keboola.ex-google-bigquery-v2/ga4-raw-events-ua-ga4-comparison-app",
      rows: [
        {
          id: ConfigRowId("event-params"),
          path: "rows/event-params",
        },
        {
          id: ConfigRowId("main-table"),
          path: "rows/main-table",
        },
        {
          id: ConfigRowId("user-properties"),
          path: "rows/user-properties",
        },
      ],
    },
    {
      componentId: "keboola.orchestrator",
      id: ConfigId("google-analytics-comparison-ua-ga4-comparison-app"),
      path: "other/keboola.orchestrator/google-analytics-comparison-ua-ga4-comparison-app",
      rows: [],
    },

    if HasProjectBackend("snowflake") then {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("ua-ua-ga4-comparison-app"),
      path: "transformation/keboola.snowflake-transformation/ua-ua-ga4-comparison-app",
      rows: []
    } else if HasProjectBackend("bigquery") then {
      componentId: "keboola.google-bigquery-transformation",
      id: ConfigId("ua-ua-ga4-comparison-app"),
      path: "transformation/keboola.google-bigquery-transformation/ua-ua-ga4-comparison-app",
      rows: []
    
    if InputIsAvailable("oauth-googleanalytics4") then

    if HasProjectBackend("snowflake") then {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("ga4-api-ua-ga4-comparison-app"),
      path: "transformation/keboola.snowflake-transformation/ga4-api-ua-ga4-comparison-app",
      rows: []
    } else if HasProjectBackend("bigquery") then {
      componentId: "keboola.google-bigquery-transformation",
      id: ConfigId("ga4-api-ua-ga4-comparison-app"),
      path: "transformation/keboola.google-bigquery-transformation/ga4-api-ua-ga4-comparison-app",
      rows: []
    
    if InputIsAvailable("ex-google-bigquery-v2-service-account-private-key") then

    if HasProjectBackend("snowflake") then {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("ga4-bigquery-ua-ga4-comparison-app"),
      path: "transformation/keboola.snowflake-transformation/ga4-bigquery-ua-ga4-comparison-app",
      rows: []
    } else if HasProjectBackend("bigquery") then {
      componentId: "keboola.google-bigquery-transformation",
      id: ConfigId("ga4-bigquery-ua-ga4-comparison-app"),
      path: "transformation/keboola.google-bigquery-transformation/ga4-bigquery-ua-ga4-comparison-app",
      rows: []
    
  ])
}
