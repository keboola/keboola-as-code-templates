{
  name: "keboola.wr-db-mssql-v2-" + ConfigId("export-models-to-ms-sql"),
  enabled: true,
  task: {
    mode: "run",
    configPath: "writer/keboola.wr-db-mssql-v2/export-models-to-ms-sql",
  },
  continueOnFailure: false,
}
