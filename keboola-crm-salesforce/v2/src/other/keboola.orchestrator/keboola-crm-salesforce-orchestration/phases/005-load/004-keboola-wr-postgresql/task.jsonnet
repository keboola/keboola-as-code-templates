{
  name: "keboola.wr-db-pgsql-" + ConfigId("out-crm-postgresql-writer"),
  task: {
    mode: "run",
    configPath: "<common>/out-crm-postgresql/v0/src/writer/keboola.wr-db-pgsql/out-crm-postgresql-writer",
  },
  continueOnFailure: false,
  enabled: true,
}
