{ 
  mainConfig: 
  {
    componentId: "keboola.orchestrator",
    id: ConfigId("keboola-dbt-tutorial"),
  },
  configurations: std.filter(function(v) v != null,[
    {
      componentId: "keboola.ex-http",
      id: ConfigId("seed-extraction"),
      path: "extractor/keboola.ex-http/seed-extraction",
      rows: [
        {
          id: ConfigRowId("seed-breweries-csv"),
          path: "rows/seed-breweries-csv",
        },
        {
          id: ConfigRowId("seed-beers-csv"),
          path: "rows/seed-beers-csv",
        },
      ],
    },
    {
      componentId: "keboola.orchestrator",
      id: ConfigId("keboola-dbt-tutorial"),
      path: "other/keboola.orchestrator/keboola-dbt-tutorial",
      rows: [],
    },
    {
      componentId: "keboola.dbt-transformation",
      id: ConfigId("beer-demo"),
      path: "transformation/keboola.dbt-transformation/beer-demo",
      rows: [],
    },
    if InputIsAvailable("wr-db-mssql-v2-db-host") then
    {
      componentId: "keboola.wr-db-mssql-v2",
      id: ConfigId("export-models-to-ms-sql"),
      path: "writer/keboola.wr-db-mssql-v2/export-models-to-ms-sql",
      rows: [
        {
          id: ConfigRowId("promo-deliveries-002"),
          path: "rows/promo-deliveries-002",
        },
        {
          id: ConfigRowId("sales-002"),
          path: "rows/sales-002",
        },
      ],
    },
    if InputIsAvailable("wr-db-mysql-db-host") then
    {
      componentId: "keboola.wr-db-mysql",
      id: ConfigId("export-models-to-my-sql"),
      path: "writer/keboola.wr-db-mysql/export-models-to-my-sql",
      rows: [
        {
          id: ConfigRowId("promo-deliveries"),
          path: "rows/promo-deliveries",
        },
        {
          id: ConfigRowId("sales"),
          path: "rows/sales",
        },
      ],
    },
    if InputIsAvailable("wr-db-pgsql-db-host") then
    {
      componentId: "keboola.wr-db-pgsql",
      id: ConfigId("export-models-to-postgre-sql"),
      path: "writer/keboola.wr-db-pgsql/export-models-to-postgre-sql",
      rows: [
        {
          id: ConfigRowId("promo-deliveries-001"),
          path: "rows/promo-deliveries-001",
        },
        {
          id: ConfigRowId("sales-001"),
          path: "rows/sales-001",
        },
      ],
    },
    if InputIsAvailable("wr-google-bigquery-v2-service-account-private-key") then
    {
      componentId: "keboola.wr-google-bigquery-v2",
      id: ConfigId("export-models-to-bigquery"),
      path: "writer/keboola.wr-google-bigquery-v2/export-models-to-bigquery",
      rows: [
        {
          id: ConfigRowId("promo-deliveries-002"),
          path: "rows/promo-deliveries-002",
        },
        {
          id: ConfigRowId("sales-002"),
          path: "rows/sales-002",
        },
      ],
    },
    if InputIsAvailable("wr-snowflake-db-host") then
    {
      componentId: SnowflakeWriterComponentId(),
      id: ConfigId("export-models-to-snowflake"),
      path: "writer/keboola.wr-snowflake-blob-storage/export-models-to-snowflake",
      rows: [
        {
          id: ConfigRowId("promo-deliveries-003"),
          path: "rows/promo-deliveries-003",
        },
        {
          id: ConfigRowId("sales-003"),
          path: "rows/sales-003",
        },
      ],
    },
  ]),
}

