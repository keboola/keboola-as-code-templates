{
  mainConfig: {
    componentId: "keboola.snowflake-transformation",
    id: ConfigId("transformation"),
  },
  configurations: [
    {
      componentId: "kds-team.ex-shopify",
      id: ConfigId("my-shopify-data-source"),
      path: "extractor/kds-team.ex-shopify/my-shopify-data-source",
      rows: [],
    },
    {
      componentId: "kds-team.ex-shoptet-permalink",
      id: ConfigId("my-shoptet-permalink-data-source"),
      path: "extractor/kds-team.ex-shoptet-permalink/my-shoptet-permalink-data-source",
      rows: [],
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("transformation"),
      path: "transformation/keboola.snowflake-transformation/transformation",
      rows: [],
    },
    {
      componentId: "keboola.gooddata-writer",
      id: ConfigId("my-good-data-data-destination"),
      path: "writer/keboola.gooddata-writer/my-good-data-data-destination",
      rows: [],
    },
    {
      componentId: "keboola.wr-google-drive",
      id: ConfigId("my-google-drive-data-destination"),
      path: "writer/keboola.wr-google-drive/my-google-drive-data-destination",
      rows: [],
    },
    {
      componentId: "keboola.wr-google-sheets",
      id: ConfigId("my-google-sheets-data-destination"),
      path: "writer/keboola.wr-google-sheets/my-google-sheets-data-destination",
      rows: [],
    },
    {
      componentId: "keboola.wr-snowflake-blob-storage",
      id: ConfigId("my-snowflake-data-destination"),
      path: "writer/keboola.wr-snowflake-blob-storage/my-snowflake-data-destination",
      rows: [],
    },
    {
      componentId: "tde-exporter",
      id: ConfigId("my-tableau-tde-data-destination"),
      path: "writer/tde-exporter/my-tableau-tde-data-destination",
      rows: [],
    },
  ],
}
