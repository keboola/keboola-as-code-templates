{
  name: "keboola.wr-snowflake-blob-storage-" + ConfigId("out-thoughtspot-gaa-snowflake-writer"),
  task: {
    mode: "run",
    configPath: "writer/keboola.wr-snowflake-blob-storage/out-thoughtspot-gaa-snowflake-writer",
  },
  continueOnFailure: false,
  enabled: true,
}
