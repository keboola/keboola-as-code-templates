{ mainConfig: {
    componentId: "keboola.orchestrator",
    id: ConfigId("thoughtspot-analytics-googleanalytics-orchestration-15471164"),
  },
  configurations: std.filter(function(v) v != null, [
    {
      componentId: "keboola.orchestrator",
      id: ConfigId("thoughtspot-analytics-googleanalytics-orchestration-15471164"),
      path: "other/keboola.orchestrator/thoughtspot-analytics-googleanalytics-orchestration-15471164",
      rows: [],
    },
    {
      componentId: "keboola.ex-google-analytics-v4",
      id: ConfigId("in-thoughtspot-gaa-extractor-15471164"),
      path: "<common>/in-thoughtspot-googleanalytics/v0/src/extractor/keboola.ex-google-analytics-v4/in-thoughtspot-gaa-extractor-15471164",
      rows: [],
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("in-thoughtspot-gaa-transformation-15471164"),
      path: "<common>/in-thoughtspot-googleanalytics/v0/src/transformation/keboola.snowflake-transformation/in-thoughtspot-gaa-transformation-15471164",
      rows: [],
      metadata: { "KBC.configuration.folderName": "[THOUGHTSPOT-ANALYTICS-GOOGLEANALYTICS]"}
    },
    if InputIsAvailable("wr-google-bigquery-v2-service-account-private-key") then
    {
      componentId: "keboola.wr-google-bigquery-v2",
      id: ConfigId("out-thoughtspot-gaa-bigquery-writer-15471164"),
      path: "<common>/out-thoughtspot-googleanalytics-bigquery/v0/src/writer/keboola.wr-google-bigquery-v2/out-thoughtspot-gaa-bigquery-writer-15471164",
      rows: [
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
      ],
    },
    if InputIsAvailable("wr-snowflake-blob-storage-db-host") then
    {
      componentId: "keboola.wr-snowflake-blob-storage",
      id: ConfigId("out-thoughtspot-gaa-snowflake-writer-15471164"),
      path: "<common>/out-thoughtspot-googleanalytics-snowflake/v0/src/writer/keboola.wr-snowflake-blob-storage/out-thoughtspot-gaa-snowflake-writer-15471164",
      rows: [
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
          id: ConfigRowId("raw-page-behaviour"),
          path: "rows/raw-page-behaviour",
        },
      ],
    },
    if InputIsAvailable("gsc-domain") then
    {
      componentId: "kds-team.ex-google-search-console",
      id: ConfigId("in-thoughtspot-googleanalytics-searchconsole-extractor-16240909"),
      path: "<common>/in-thoughtspot-googleanalytics-searchconsole/v0/src/extractor/kds-team.ex-google-search-console/in-thoughtspot-googleanalytics-searchconsole-extractor-16240909",
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
      id: ConfigId("in-thoughtspot-googleanalytics-searchconsole-transformation-16240909"),
      path: "<common>/in-thoughtspot-googleanalytics-searchconsole/v0/src/transformation/keboola.snowflake-transformation/in-thoughtspot-googleanalytics-searchconsole-transformation-16240909",
      rows: [],
    },
    if InputIsAvailable("wr-google-bigquery-v2-service-account-private-key") then
      if InputIsAvailable("gsc-domain") then
        {
          componentId: "keboola.wr-google-bigquery-v2",
          id: ConfigId("out-thoughtspot-googleanalytics-bigquery-searchconsole-writer-16240909"),
          path: "<common>/out-thoughtspot-googleanalytics-bigquery-searchconsole/v0/src/writer/keboola.wr-google-bigquery-v2/out-thoughtspot-googleanalytics-bigquery-searchconsole-writer-16240909",
          rows: [
            {
              id: ConfigRowId("gsc_ranking"),
              path: "rows/gsc_ranking",
            },
          ],
        },
    if InputIsAvailable("wr-snowflake-blob-storage-db-host") then
      if InputIsAvailable("gsc-domain") then
        {
          componentId: "keboola.wr-snowflake-blob-storage",
          id: ConfigId("out-thoughtspot-googleanalytics-snowflake-searchconsole-writer-15471164"),
          path: "<common>/out-thoughtspot-googleanalytics-snowflake-searchconsole/v0/src/writer/keboola.wr-snowflake-blob-storage/out-thoughtspot-googleanalytics-snowflake-searchconsole-writer-15471164",
          rows: [
            {
              id: ConfigRowId("gsc_ranking"),
              path: "rows/gsc_ranking",
            },
          ],
        },
    ],)
}
