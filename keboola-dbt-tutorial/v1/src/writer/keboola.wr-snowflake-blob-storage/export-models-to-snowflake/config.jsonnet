{
  parameters: {
    db: {
      driver: "snowflake",
      port: Input("wr-snowflake-blob-storage-db-port"),
      host: Input("wr-snowflake-blob-storage-db-host"),
      user: Input("wr-snowflake-blob-storage-db-user"),
      "#password": Input("wr-snowflake-blob-storage-db-password"),
      database: Input("wr-snowflake-blob-storage-db-database"),
      schema: Input("wr-snowflake-blob-storage-db-schema"),
      warehouse: Input("wr-snowflake-blob-storage-db-warehouse"),
    },
  },
  runtime: {
    parallelism: null,
  },
}
