{
  configurations:[
    {
      componentId: "keboola.wr-snowflake-blob-storage",
      id: ConfigId("snowflake-keboola-costs"),
      path: "writer/keboola.wr-snowflake-blob-storage/snowflake-keboola-costs",
      rows: [
        {
          id: ConfigRowId("components"),
          path: "rows/components",
        },
        {
          id: ConfigRowId("configurations"),
          path: "rows/configurations",
        },
        {
          id: ConfigRowId("configurations-versions"),
          path: "rows/configurations-versions",
        },
        {
          id: ConfigRowId("jobs"),
          path: "rows/jobs",
        },
        {
          id: ConfigRowId("kbc-usage-metrics-values"),
          path: "rows/kbc-usage-metrics-values",
        },
        {
          id: ConfigRowId("projects"),
          path: "rows/projects",
        },
        {
          id: ConfigRowId("snowflake-statistics"),
          path: "rows/snowflake-statistics",
        },
      ],
    },
  ],
}
