{
  name: "keboola.wr-db-pgsql-" + ConfigId("out-mgmt-postgresql-writer"),
  task: {
    mode: "run",
    configPath: "<common>/out-mgmt-postgresql/v0/src/writer/keboola.wr-db-pgsql/out-mgmt-postgresql-writer",
  },
  continueOnFailure: false,
  enabled: true,
}
