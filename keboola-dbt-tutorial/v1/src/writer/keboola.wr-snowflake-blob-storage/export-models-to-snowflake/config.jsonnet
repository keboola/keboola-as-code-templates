{
  parameters: {
    db: {
      driver: "snowflake",
      port: Input("wr-snowflake-db-port"),
      host: Input("wr-snowflake-db-host"),
      user: Input("wr-snowflake-db-user"),
      "#password": Input("wr-snowflake-db-password"),
      database: Input("wr-snowflake-db-database"),
      schema: Input("wr-snowflake-db-schema"),
      warehouse: Input("wr-snowflake-db-warehouse"),
    },
  },
  runtime: {
    parallelism: null,
  },
}
