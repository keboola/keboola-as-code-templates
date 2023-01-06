{
  name: "keboola.wr-snowflake-blob-storage-" + ConfigId("export-models-to-snowflake"),
  enabled: true,
  task: {
    mode: "run",
    configPath: "writer/keboola.wr-snowflake-blob-storage/export-models-to-snowflake",
  },
  continueOnFailure: false,
}
