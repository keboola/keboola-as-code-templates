{
  name: "keboola.wr-db-pgsql-" + ConfigId("out-mailchimp-postgresql-writer"),
  task: {
    mode: "run",
    configPath: "<common>/out-mailchimp-postgresql/v0/src/writer/keboola.wr-db-pgsql/out-mailchimp-postgresql-writer",
  },
  continueOnFailure: false,
  enabled: true,
}
