{ mainConfig: {
    componentId: "keboola.orchestrator",
    id: ConfigId("keboola-analytics-googleanalytics-orchestration-15471164"),
  },
  configurations: std.filter(function(v) v != null, [
    {
      componentId: "keboola.orchestrator",
      id: ConfigId("keboola-analytics-googleanalytics-orchestration-15471164"),
      path: "other/keboola.orchestrator/keboola-analytics-googleanalytics-orchestration-15471164",
      rows: [],
    },
    {
      componentId: "keboola.ex-google-analytics-v4",
      id: ConfigId("in-googleanalytics-extractor-15471164"),
      path: "<common>/in-googleanalytics/v0/src/extractor/keboola.ex-google-analytics-v4/in-googleanalytics-extractor-15471164",
      rows: [],
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("in-googleanalytics-transformation-15471164"),
      path: "<common>/in-googleanalytics/v0/src/transformation/keboola.snowflake-transformation/in-googleanalytics-transformation-15471164",
      rows: [],
      metadata: { "KBC.configuration.folderName": "[KEBOOLA-ANALYTICS-GOOGLEANALYTICS]"}
    },
    if InputIsAvailable("wr-google-bigquery-v2-service-account-private-key") then
    {
      componentId: "keboola.wr-google-bigquery-v2",
      id: ConfigId("out-googleanalytics-bigquery-writer-15471164"),
      path: "<common>/out-googleanalytics-bigquery/v0/src/writer/keboola.wr-google-bigquery-v2/out-googleanalytics-bigquery-writer-15471164",
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
    if InputIsAvailable("wr-snowflake-blob-storage-db-host") then
    {
      componentId: "keboola.wr-snowflake-blob-storage",
      id: ConfigId("out-googleanalytics-snowflake-writer-15471164"),
      path: "<common>/out-googleanalytics-snowflake/v0/src/writer/keboola.wr-snowflake-blob-storage/out-googleanalytics-snowflake-writer-15471164",
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
    if InputIsAvailable("gsc-domain") then
    {
      componentId: "kds-team.ex-google-search-console",
      id: ConfigId("in-googleanalytics-searchconsole-extractor-16240909"),
      path: "<common>/in-googleanalytics-searchconsole/v0/src/extractor/kds-team.ex-google-search-console/in-googleanalytics-searchconsole-extractor-16240909",
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
      id: ConfigId("in-googleanalytics-searchconsole-transformation-16240909"),
      path: "<common>/in-googleanalytics-searchconsole/v0/src/transformation/keboola.snowflake-transformation/in-googleanalytics-searchconsole-transformation-16240909",
      rows: [],
      metadata: { "KBC.configuration.folderName": "[KEBOOLA-ANALYTICS-GOOGLEANALYTICS]"}
    },
    ],)
}
