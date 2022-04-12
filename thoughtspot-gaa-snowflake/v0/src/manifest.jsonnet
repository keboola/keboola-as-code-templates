{
  configurations: [
    {
      componentId: "keboola.ex-google-analytics-v4",
      id: ConfigId("thoughtspot-gaa-snowflake-extractor-15171889"),
      path: "extractor/keboola.ex-google-analytics-v4/thoughtspot-gaa-snowflake-extractor-15171889",
      rows: [],
    },
    {
      componentId: "keboola.orchestrator",
      id: ConfigId("thoughtspot-gaa-snowflake-orchestration-15171889"),
      path: "other/keboola.orchestrator/thoughtspot-gaa-snowflake-orchestration-15171889",
      rows: [],
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("thoughtspot-gaa-snowflake-transformation-15171889"),
      path: "transformation/keboola.snowflake-transformation/thoughtspot-gaa-snowflake-transformation-15171889",
      rows: [],
    },
    {
      componentId: "keboola.variables",
      id: ConfigId("variables-definition-for-keboola-snowflake-transformation-15171893"),
      path: "variables",
      relations: [
        {
          componentId: "keboola.snowflake-transformation",
          configId: ConfigId("thoughtspot-gaa-snowflake-transformation-15171889"),
          type: "variablesFor",
        },
      ],
      rows: [
        {
          id: ConfigRowId("default-values"),
          path: "values/default-values",
          relations: [
            {
              type: "variablesValuesFor",
            },
          ],
        },
      ],
    },
    {
      componentId: "keboola.wr-snowflake-blob-storage",
      id: ConfigId("thoughtspot-gaa-snowflake-writer-15171889"),
      path: "writer/keboola.wr-snowflake-blob-storage/thoughtspot-gaa-snowflake-writer-15171889",
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
  ],
}
