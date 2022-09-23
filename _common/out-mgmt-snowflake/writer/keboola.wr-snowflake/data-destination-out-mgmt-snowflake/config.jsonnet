{
  parameters: {
    db: {
      port: Input("wr-snowflake-db-port"),
      schema: Input("wr-snowflake-db-schema"),
      warehouse: Input("wr-snowflake-db-warehouse"),
      driver: "snowflake",
      host: "keboola.west-europe.azure.snowflakecomputing.com",
      user: Input("wr-snowflake-db-user"),
      database: Input("wr-snowflake-db-database"),
      "#password": Input("wr-snowflake-db-password"),
    },
  },
}
