{
  parameters: {
    db: {
      port: Input("ex-snowflake-db-port"),
      host: Input("ex-snowflake-db-host"),
      user: Input("ex-snowflake-db-user"),
      "#password": Input("ex-snowflake-db-password"),
      database: "SNOWFLAKE",
      schema: "INFORMATION_SCHEMA",
      warehouse: Input("ex-snowflake-db-warehouse"),
    },
  },
}
