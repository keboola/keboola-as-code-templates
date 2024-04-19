{
  name: "keboola.wr-db-pgsql-" + ConfigId("keboola-marketingchannels-postgresql-data-destination"),
  task: {
    mode: "run",
    configPath: "<common>/out-marketingchannels-postgresql/v0/writer/keboola.wr-db-pgsql/keboola-marketingchannels-postgresql-data-destination",
  },
  continueOnFailure: false,
  enabled: true,
}
