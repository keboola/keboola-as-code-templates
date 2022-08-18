{
  name: "keboola.wr-snowflake-blob-storage-" + ConfigId("out-thoughtspot-hubspot-snowflake-writer"),
  task: {
    mode: "run",
    configPath: "writer/keboola.wr-snowflake-blob-storage/out-thoughtspot-hubspot-snowflake-writer",
  },
  continueOnFailure: false,
  enabled: true,
}
