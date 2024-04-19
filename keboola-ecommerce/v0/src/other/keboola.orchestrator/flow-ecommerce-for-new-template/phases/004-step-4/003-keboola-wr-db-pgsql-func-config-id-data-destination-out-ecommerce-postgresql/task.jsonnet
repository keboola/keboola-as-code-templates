{
  name: "keboola.wr-db-pgsql-" + ConfigId("data-destination-out-ecommerce-postgresql"),
  enabled: true,
  task: {
    mode: "run",
    configPath: "<common>/out-ecommerce-postgresql/v1/src/writer/keboola.wr-db-pgsql/data-destination-out-ecommerce-postgresql",
  },
  continueOnFailure: false,
}
