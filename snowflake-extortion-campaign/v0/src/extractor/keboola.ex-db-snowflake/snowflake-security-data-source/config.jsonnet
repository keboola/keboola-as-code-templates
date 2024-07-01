{
  parameters: {
    db: {
      port: Input("ex-snowflake-db-port"),
      host: Input("ex-snowflake-db-host"),
      user: Input("ex-snowflake-db-user"),
      "#password": Input("ex-snowflake-db-password"),
      database: Input("ex-snowflake-db-database"),
      schema: Input("ex-snowflake-db-schema"),
      warehouse: Input("ex-snowflake-db-warehouse"),
    },
  },
}
