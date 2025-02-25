{
  parameters: {
    db: {
      driver: "pgsql",
      port: Input("wr-db-pgsql-db-port"),
      schema: Input("wr-db-pgsql-db-schema"),
      host: Input("wr-db-pgsql-db-host"),
      user: Input("wr-db-pgsql-db-user"),
      "#password": Input("wr-db-pgsql-db-password"),
      database: Input("wr-db-pgsql-db-database"),
    },
  },
  runtime: {
    parallelism: "2",
  },
}
