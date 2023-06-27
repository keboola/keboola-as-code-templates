{
  name: "keboola.wr-db-pgsql-" + ConfigId("out-ecommerce-postgresql-writer"),
  task: {
    mode: "run",
    configPath: "<common>/out-ecommerce-postgresql/v0/src/writer/keboola.wr-db-pgsql/out-ecommerce-postgresql-writer",
  },
  continueOnFailure: false,
  enabled: true,
}
