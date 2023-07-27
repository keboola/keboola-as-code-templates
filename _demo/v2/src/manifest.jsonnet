{
  mainConfig: {
    componentId: "keboola.snowflake-transformation",
    id: ConfigId("transformation"),
  },
  configurations: std.filter(function(v) v != null,[
    if InputIsAvailable("user") then
    {
      componentId: "kds-team.ex-shopify",
      id: ConfigId("my-shopify-data-source"),
      path: "extractor/kds-team.ex-shopify/my-shopify-data-source",
      rows: [],
    },
    if InputIsAvailable("host") then
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
    if InputIsAvailable("g3s1-host") then
    {
      componentId: "keboola.gooddata-writer",
      id: ConfigId("my-good-data-data-destination"),
      path: "writer/keboola.gooddata-writer/my-good-data-data-destination",
      rows: [],
    },
    if InputIsAvailable("g3s2-host") then
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
    if InputIsAvailable("g3s4-host") then
    {
      componentId: "keboola.wr-snowflake-blob-storage",
      id: ConfigId("my-snowflake-data-destination"),
      path: "writer/keboola.wr-snowflake-blob-storage/my-snowflake-data-destination",
      rows: [],
    },
    if InputIsAvailable("g3s5-token") then
    {
      componentId: "tde-exporter",
      id: ConfigId("my-tableau-tde-data-destination"),
      path: "writer/tde-exporter/my-tableau-tde-data-destination",
      rows: [],
    },
  ]),
}
