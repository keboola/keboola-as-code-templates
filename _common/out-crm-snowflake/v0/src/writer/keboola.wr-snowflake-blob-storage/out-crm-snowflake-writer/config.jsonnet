{
  parameters: {
    db: {
      port: Input("wr-snowflake-blob-storage-db-port"),
      schema: Input("wr-snowflake-blob-storage-db-schema"),
      warehouse: Input("wr-snowflake-blob-storage-db-warehouse"),
      driver: "snowflake",
      host: Input("wr-snowflake-blob-storage-db-host"),
      user: Input("wr-snowflake-blob-storage-db-user"),
      database: Input("wr-snowflake-blob-storage-db-database"),
      "#password": Input("wr-snowflake-blob-storage-db-password"),
    },
  },
}
