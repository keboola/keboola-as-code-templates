{
  parameters: {
    db: {
      driver: "mysql",
      port: Input("wr-db-mysql-db-port"),
      host: Input("wr-db-mysql-db-host"),
      user: Input("wr-db-mysql-db-user"),
      "#password": Input("wr-db-mysql-db-password"),
      database: Input("wr-db-mysql-db-database"),
    },
  },
  runtime: {
    parallelism: "2",
  },
}
