{
  name: "keboola.wr-db-mysql-" + ConfigId("export-models-to-my-sql"),
  enabled: true,
  task: {
    mode: "run",
    configPath: "writer/keboola.wr-db-mysql/export-models-to-my-sql",
  },
  continueOnFailure: false,
}
