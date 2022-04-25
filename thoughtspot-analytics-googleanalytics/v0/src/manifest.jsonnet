{
  configurations: [
    {
      componentId: "keboola.ex-google-analytics-v4",
      id: ConfigId("in-thoughtspot-gaa-extractor-15471164"),
      path: "extractor/keboola.ex-google-analytics-v4/in-thoughtspot-gaa-extractor-15471164",
      rows: [],
    },
    {
      componentId: "keboola.orchestrator",
      id: ConfigId("in-thoughtspot-gaa-orchestration-bdm-creation-15471164"),
      path: "other/keboola.orchestrator/in-thoughtspot-gaa-orchestration-bdm-creation-15471164",
      rows: [],
    },
    {
      componentId: "keboola.orchestrator",
      id: ConfigId("thoughtspot-analytics-googleanalytics-orchestration-15471164"),
      path: "other/keboola.orchestrator/thoughtspot-analytics-googleanalytics-orchestration-15471164",
      rows: [],
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("in-thoughtspot-gaa-transformation-15471164"),
      path: "transformation/keboola.snowflake-transformation/in-thoughtspot-gaa-transformation-15471164",
      rows: [],
    },
    if std.member(Input("select-writer"), "big-query") then
    {
      componentId: "keboola.orchestrator",
      id: ConfigId("out-thoughtspot-gaa-bigquery-orchestration-bdm-usage-15471164"),
      path: "other/keboola.orchestrator/out-thoughtspot-gaa-bigquery-orchestration-bdm-usage-15471164",
      rows: [],
    }
    else if std.member(Input("select-writer"), "snowflake-db") then
    {
      componentId: "keboola.orchestrator",
      id: ConfigId("out-thoughtspot-gaa-snowflake-orchestration-bdm-usage-15471164"),
      path: "other/keboola.orchestrator/out-thoughtspot-gaa-snowflake-orchestration-bdm-usage-15471164",
      rows: [],
    },
    if std.member(Input("select-writer"), "big-query") then
    {
      componentId: "keboola.wr-google-bigquery-v2",
      id: ConfigId("out-thoughtspot-gaa-bigquery-writer-15471164"),
      path: "writer/keboola.wr-google-bigquery-v2/out-thoughtspot-gaa-bigquery-writer-15471164",
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
    }
    else if std.member(Input("select-writer"), "snowflake-db") then
    {
      componentId: "keboola.wr-snowflake-blob-storage",
      id: ConfigId("out-thoughtspot-gaa-snowflake-writer-15471164"),
      path: "writer/keboola.wr-snowflake-blob-storage/out-thoughtspot-gaa-snowflake-writer-15471164",
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
  ],
}
