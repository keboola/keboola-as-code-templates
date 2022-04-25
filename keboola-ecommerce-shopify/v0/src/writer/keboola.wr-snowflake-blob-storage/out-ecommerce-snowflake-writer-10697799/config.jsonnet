{
  parameters: {
    db: {
      port: "443",
      schema: "WORKSPACE_13631041",
      warehouse: "KEBOOLA_PROD",
      driver: "snowflake",
      host: "keboola.west-europe.azure.snowflakecomputing.com",
      user: "KEBOOLA_WORKSPACE_13631041",
      database: "KEBOOLA_6518",
      "#password": Input("wr-snowflake-blob-storage-db-password"),
    },
  },
}
