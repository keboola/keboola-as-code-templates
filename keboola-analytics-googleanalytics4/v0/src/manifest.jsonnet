{ mainConfig: {
    componentId: "keboola.orchestrator",
    id: ConfigId("flow-analytics-googleanalytics4"),
  },
  configurations: std.filter(function(v) v != null, [
    {
      componentId: "keboola.orchestrator",
      id: ConfigId("flow-analytics-googleanalytics4"),
      path: "other/keboola.orchestrator/flow-analytics-googleanalytics4",
      rows: [],
    },
    {
      componentId: "keboola.ex-google-analytics-v4",
      id: ConfigId("in-googleanalytics4-extractor"),
      path: "<common>/in-googleanalytics4/v0/src/extractor/keboola.ex-google-analytics-v4/in-googleanalytics4-extractor",
      rows: [
        {
          id: ConfigRowId("raw-ad-analytics"),
          path: "rows/raw-ad-analytics",
        },
        {
          id: ConfigRowId("raw-audience"),
          path: "rows/raw-audience",
        },
        {
          id: ConfigRowId("raw-demographic"),
          path: "rows/raw-demographic",
        },
        {
          id: ConfigRowId("raw-event"),
          path: "rows/raw-event",
        },
        {
          id: ConfigRowId("raw-geo-audience"),
          path: "rows/raw-geo-audience",
        },
        {
          id: ConfigRowId("raw-landing-page-statistics"),
          path: "rows/raw-landing-page-statistics",
        },
        {
          id: ConfigRowId("raw-traffic-acquisition"),
          path: "rows/raw-traffic-acquisition",
        },
      ],
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("in-googleanalytics4-transformation"),
      path: "<common>/in-googleanalytics4/v0/src/transformation/keboola.snowflake-transformation/in-googleanalytics4-transformation",
      rows: [],
      metadata: {"KBC.configuration.folderName": "[ANALYTICS-GOOGLEANALYTICS4]"},
    },
    if InputIsAvailable("wr-postgresql-db-hostname") then
    {
      componentId: "keboola.wr-db-pgsql",
      id: ConfigId("data-destination-out-googleanalytics4-postgresql"),
      path: "<common>/out-googleanalytics4-postgresql/src/writer/keboola.wr-db-pgsql/data-destination-out-googleanalytics4-postgresql",
      rows: std.filter(function(v) v != null, [
        {
          id: ConfigRowId("ga4-ad-analytics"),
          path: "rows/ga4-ad-analytics",
        },
        {
          id: ConfigRowId("ga4-audience"),
          path: "rows/ga4-audience",
        },
        {
          id: ConfigRowId("ga4-demographic-audience"),
          path: "rows/ga4-demographic-audience",
        },
        {
          id: ConfigRowId("ga4-event"),
          path: "rows/ga4-event",
        },
        {
          id: ConfigRowId("ga4-geo-audience"),
          path: "rows/ga4-geo-audience",
        },
        {
          id: ConfigRowId("ga4-page-behaviour"),
          path: "rows/ga4-page-behaviour",
        },
        {
          id: ConfigRowId("ga4-traffic-source"),
          path: "rows/ga4-traffic-source",
        },
        if InputIsAvailable("gsc-domain") then
        {
          id: ConfigRowId("gsc-ranking"),
          path: "rows/gsc-ranking",
        },
      ]),
    },
    if InputIsAvailable("wr-google-bigquery-v2-service-account-private-key") then
    {
      componentId: "keboola.wr-google-bigquery-v2",
      id: ConfigId("data-destination-out-googleanalytics4-bigquery"),
      path: "<common>/out-googleanalytics4-bigquery/v0/src/writer/keboola.wr-google-bigquery-v2/data-destination-out-googleanalytics4-bigquery",
      rows: std.filter(function(v) v != null, [
        {
          id: ConfigRowId("ga4-ad-analytics"),
          path: "rows/ga4-ad-analytics",
        },
        {
          id: ConfigRowId("ga4-audience"),
          path: "rows/ga4-audience",
        },
        {
          id: ConfigRowId("ga4-demographic-audience"),
          path: "rows/ga4-demographic-audience",
        },
        {
          id: ConfigRowId("ga4-event"),
          path: "rows/ga4-event",
        },
        {
          id: ConfigRowId("ga4-geo-audience"),
          path: "rows/ga4-geo-audience",
        },
        {
          id: ConfigRowId("ga4-page-behaviour"),
          path: "rows/ga4-page-behaviour",
        },
        {
          id: ConfigRowId("ga4-traffic-source"),
          path: "rows/ga4-traffic-source",
        },
        if InputIsAvailable("gsc-domain") then
        {
          id: ConfigRowId("gsc-ranking"),
          path: "rows/gsc-ranking",
        },
      ]),
    },
    if InputIsAvailable("google-sheet-id") then
    {
      componentId: "keboola.wr-google-sheets",
      id: ConfigId("data-destination-out-googleanalytics4-gsheet"),
      path: "<common>/out-googleanalytics4-gsheet/v0/src/writer/keboola.wr-google-sheets/data-destination-out-googleanalytics4-gsheet",
      rows: [],
    },
    if InputIsAvailable("wr-snowflake-db-host") then
    {
      componentId: SnowflakeWriterComponentId(),
      id: ConfigId("data-destination-out-googleanalytics4-snowflake"),
      path: "<common>/out-googleanalytics4-snowflake/v0/src/writer/keboola.wr-snowflake-blob-storage/data-destination-out-googleanalytics4-snowflake",
      rows: std.filter(function(v) v != null, [
        {
          id: ConfigRowId("ga4-ad-analytics"),
          path: "rows/ga4-ad-analytics",
        },
        {
          id: ConfigRowId("ga4-audience"),
          path: "rows/ga4-audience",
        },
        {
          id: ConfigRowId("ga4-demographic-audience"),
          path: "rows/ga4-demographic-audience",
        },
        {
          id: ConfigRowId("ga4-event"),
          path: "rows/ga4-event",
        },
        {
          id: ConfigRowId("ga4-geo-audience"),
          path: "rows/ga4-geo-audience",
        },
        {
          id: ConfigRowId("ga4-page-behaviour"),
          path: "rows/ga4-page-behaviour",
        },
        {
          id: ConfigRowId("ga4-traffic-source"),
          path: "rows/ga4-traffic-source",
        },
        if InputIsAvailable("gsc-domain") then
        {
          id: ConfigRowId("gsc-ranking"),
          path: "rows/gsc-ranking",
        },
      ]),
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
      metadata: { "KBC.configuration.folderName": "[ANALYTICS-GOOGLEANALYTICS4]"}
    },
  ]),
}
