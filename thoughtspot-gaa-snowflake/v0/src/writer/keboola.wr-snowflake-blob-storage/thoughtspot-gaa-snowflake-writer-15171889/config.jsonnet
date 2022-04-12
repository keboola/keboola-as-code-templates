{
  parameters: {
    db: {
      port: "443",
      schema: "WORKSPACE_15173434",
      warehouse: "KEBOOLA_PROD_SMALL",
      driver: "snowflake",
      host: "keboola.west-europe.azure.snowflakecomputing.com",
      user: "KEBOOLA_WORKSPACE_15173434",
      database: "KEBOOLA_7013",
      "#password": Input("wr-snowflake-blob-storage-db-password"),
    },
  },
}
