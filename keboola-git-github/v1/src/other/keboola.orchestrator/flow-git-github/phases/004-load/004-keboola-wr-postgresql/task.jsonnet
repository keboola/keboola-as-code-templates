{
  name: "keboola.wr-db-pgsql-" + ConfigId("out-git-postgresql-writer"),
  task: {
    mode: "run",
    configPath: "<common>/out-git-postgresql/v0/src/writer/keboola.wr-db-pgsql/out-git-postgresql-writer",
  },
  continueOnFailure: false,
  enabled: true,
}
