{
  parameters: {
    db: {
      port: Input("wr-snowflake-db-port"),
      schema: Input("wr-snowflake-db-schema"),
      warehouse: Input("wr-snowflake-db-warehouse"),
      driver: "snowflake",
      host: Input("wr-snowflake-db-host"),
      user: Input("wr-snowflake-db-user"),
      database: Input("wr-snowflake-db-database"),
      "#password": Input("wr-snowflake-db-password"),
    },
  },
}
