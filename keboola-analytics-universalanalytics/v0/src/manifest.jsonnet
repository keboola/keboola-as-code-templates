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
      rows: [
        {
          id: ConfigRowId("raw-ad-analytics"),
          path: "rows/raw-ad-analytics",
        },
        {
          id: ConfigRowId("raw-demographic-audience"),
          path: "rows/raw-demographic-audience",
        },
        {
          id: ConfigRowId("raw-geo-audience"),
          path: "rows/raw-geo-audience",
        },
        {
          id: ConfigRowId("raw-page-behaviour"),
          path: "rows/raw-page-behaviour",
        },
        {
          id: ConfigRowId("raw-site-statistics"),
          path: "rows/raw-site-statistics",
        },
        {
          id: ConfigRowId("raw-traffic-source"),
          path: "rows/raw-traffic-source",
        },
      ],
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("in-googleanalytics-transformation"),
      path: "<common>/in-googleanalytics/v0/src/transformation/keboola.snowflake-transformation/in-googleanalytics-transformation",
      rows: [],
      metadata: { "KBC.configuration.folderName": "[ANALYTICS-GOOGLEANALYTICS]"}
    },
    if InputIsAvailable("wr-google-bigquery-v2-service-account-private-key") then
    {
      componentId: "keboola.wr-google-bigquery-v2",
      id: ConfigId("out-googleanalytics-bigquery-writer"),
      path: "<common>/out-googleanalytics-bigquery/v0/src/writer/keboola.wr-google-bigquery-v2/out-googleanalytics-bigquery-writer",
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
        if InputIsAvailable("gsc-domain") then
        {
          id: ConfigRowId("gsc_ranking"),
          path: "rows/gsc_ranking",
        },
      ]),
    },
    if InputIsAvailable("wr-snowflake-db-host") then
    {
      componentId: SnowflakeWriterComponentId(),
      id: ConfigId("out-googleanalytics-snowflake-writer"),
      path: "<common>/out-googleanalytics-snowflake/v0/src/writer/keboola.wr-snowflake/out-googleanalytics-snowflake-writer",
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
        if InputIsAvailable("gsc-domain") then
        {
          id: ConfigRowId("gsc_ranking"),
          path: "rows/gsc_ranking",
        },
      ]),
    },
    if InputIsAvailable("google-sheet-id") then
    {
      componentId: "keboola.wr-google-sheets",
      id: ConfigId("data-destination-out-googleanalytics-gsheet"),
      path: "<common>/out-googleanalytics-gsheet/v0/src/writer/keboola.wr-google-sheets/data-destination-out-googleanalytics-gsheet",
      rows: [],
    },
    if InputIsAvailable("gsc-domain") then
    {
      componentId: "kds-team.ex-google-search-console",
      id: ConfigId("in-googleanalytics-searchconsole-extractor"),
      path: "<common>/in-googleanalytics-searchconsole/v0/src/extractor/kds-team.ex-google-search-console/in-googleanalytics-searchconsole-extractor",
      rows: [
        {
          id: ConfigRowId("google-search-console"),
          path: "rows/google-search-console",
        },
      ],
    },
    if InputIsAvailable("gsc-domain") then
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("in-googleanalytics-searchconsole-transformation"),
      path: "<common>/in-googleanalytics-searchconsole/v0/src/transformation/keboola.snowflake-transformation/in-googleanalytics-searchconsole-transformation",
      rows: [],
      metadata: { "KBC.configuration.folderName": "[ANALYTICS-GOOGLEANALYTICS]"}
    },
    ],)
}
