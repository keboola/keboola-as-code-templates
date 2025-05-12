{
  name: "keboola.wr-snowflake-" + ConfigId("create-snowflake-scheme"),
  enabled: true,
  continueOnFailure: false,
  task: {
    mode: "run",
    configPath: "writer/keboola.wr-snowflake-blob-storage/create-snowflake-scheme",
  },
}
