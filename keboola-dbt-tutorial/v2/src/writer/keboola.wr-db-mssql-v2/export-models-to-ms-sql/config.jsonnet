{
  parameters: {
    db: {
      driver: "mssql",
      port: Input("wr-db-mssql-v2-db-port"),
      tdsVersion: "7.4",
      host: Input("wr-db-mssql-v2-db-host"),
      user: Input("wr-db-mssql-v2-db-user"),
      "#password": Input("wr-db-mssql-v2-db-password"),
      database: Input("wr-db-mssql-v2-db-database"),
    },
  },
}
