{
  configurations: [
    {
      componentId: "keboola.orchestrator",
      id: ConfigId("out-thoughtspot-gaa-snowflake-orchestration-bdm-usage"),
      path: "other/keboola.orchestrator/out-thoughtspot-gaa-snowflake-orchestration-bdm-usage",
      rows: [],
    },
    {
      componentId: SnowflakeWriterComponentId(),
      id: ConfigId("out-thoughtspot-gaa-snowflake-writer"),
      path: "writer/keboola.wr-snowflake/out-thoughtspot-gaa-snowflake-writer",
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
        }
      ]
    }
  ]
}
