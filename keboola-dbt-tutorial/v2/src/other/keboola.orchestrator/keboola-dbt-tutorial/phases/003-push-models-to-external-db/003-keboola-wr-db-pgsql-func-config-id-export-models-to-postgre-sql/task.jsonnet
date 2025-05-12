{
  name: "keboola.wr-db-pgsql-" + ConfigId("export-models-to-postgre-sql"),
  enabled: true,
  task: {
    mode: "run",
    configPath: "writer/keboola.wr-db-pgsql/export-models-to-postgre-sql",
  },
  continueOnFailure: false,
}
