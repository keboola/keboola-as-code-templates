{ mainConfig: {
    componentId: "keboola.orchestrator",
    id: ConfigId("keboola-analytics-googleanalytics-orchestration"),
  },
  configurations: std.filter(function(v) v != null, [
    {
      componentId: "keboola.orchestrator",
      id: ConfigId("keboola-analytics-googleanalytics-orchestration"),
      path: "other/keboola.orchestrator/keboola-analytics-googleanalytics-orchestration",
      rows: [],
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
      metadata: { "KBC.configuration.folderName": "[THOUGHTSPOT-GOOGLEANALYTICS-SNOWFLAKE]"}
    },
    {
      componentId: "keboola.wr-snowflake-blob-storage",
      id: ConfigId("out-googleanalytics-snowflake-writer"),
      path: "<common>/out-googleanalytics-snowflake/v0/src/writer/keboola.wr-snowflake-blob-storage/out-googleanalytics-snowflake-writer",
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
