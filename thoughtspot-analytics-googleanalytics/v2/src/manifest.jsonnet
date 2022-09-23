{ mainConfig: {
    componentId: "keboola.orchestrator",
    id: ConfigId("thoughtspot-analytics-googleanalytics-orchestration"),
  },
  configurations: std.filter(function(v) v != null, [
    {
      componentId: "keboola.orchestrator",
      id: ConfigId("thoughtspot-analytics-googleanalytics-orchestration"),
      path: "other/keboola.orchestrator/thoughtspot-analytics-googleanalytics-orchestration",
      rows: [],
    },
    {
      componentId: "keboola.scheduler",
      id: ConfigId("scheduler"),
      path: "schedules/scheduler",
      relations: [
        {
          componentId: "keboola.orchestrator",
          configId: ConfigId("thoughtspot-analytics-googleanalytics-orchestration"),
          type: "schedulerFor"
        }
      ],
      rows: []
    },
    {
      componentId: "keboola.ex-google-analytics-v4",
      id: ConfigId("in-googleanalytics-extractor"),
      path: "<common>/in-googleanalytics/v0/src/extractor/keboola.ex-google-analytics-v4/in-googleanalytics-extractor",
      rows: [],
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("in-googleanalytics-transformation"),
      path: "<common>/in-googleanalytics/v0/src/transformation/keboola.snowflake-transformation/in-googleanalytics-transformation",
      rows: [],
      metadata: { "KBC.configuration.folderName": "[THOUGHTSPOT-ANALYTICS-GOOGLEANALYTICS]"}
    },
    if InputIsAvailable("wr-google-bigquery-v2-service-account-private-key") then
    {
      componentId: "keboola.wr-google-bigquery-v2",
      id: ConfigId("out-googleanalytics-bigquery-writer"),
      path: "<common>/out-thoughtspot-googleanalytics-bigquery/v0/src/writer/keboola.wr-google-bigquery-v2/out-thoughtspot-gaa-bigquery-writer",
      rows: std.filter(function(v) v != null, [
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
      ]),
    },
    if InputIsAvailable("wr-snowflake-db-host") || InputIsAvailable("wr-snowflake-selection") then
    {
      componentId: SnowflakeWriterComponentId(),
      id: ConfigId("out-googleanalytics-snowflake-writer"),
      path: "<common>/out-thoughtspot-googleanalytics-snowflake/v0/src/writer/keboola.wr-snowflake/out-thoughtspot-gaa-snowflake-writer",
      rows: std.filter(function(v) v != null, [
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
          id: ConfigRowId("ga-site-statistics"),
          path: "rows/ga-site-statistics",
        },
        {
          id: ConfigRowId("ga-traffic-source"),
          path: "rows/ga-traffic-source",
        },
        {
          id: ConfigRowId("ga-page-behaviour"),
          path: "rows/ga-page-behaviour",
        },
      ]),
    },
  ],)
}
