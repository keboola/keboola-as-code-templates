{
  parameters: {
    db: {
      driver: Input("wr-postgresql-db-driver"),
      port: Input("wr-postgresql-db-port"),
      schema: Input("wr-postgresql-db-schema"),
      host: Input("wr-postgresql-db-hostname"),
      user: Input("wr-postgresql-db-user"),
      database: Input("wr-postgresql-db-database"),
      "#password": Input("wr-postgresql-db-password")
    }
  }
}
