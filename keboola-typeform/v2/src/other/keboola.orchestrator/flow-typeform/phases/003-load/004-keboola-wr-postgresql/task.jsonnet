{
  name: "keboola.wr-db-pgsql-" + ConfigId("out-typeform-postgresql-writer"),
  task: {
    mode: "run",
    configPath: "<common>/out-typeform-postgresql/v0/src/writer/keboola.wr-db-pgsql/out-typeform-postgresql-writer",
  },
  continueOnFailure: false,
  enabled: true,
}
