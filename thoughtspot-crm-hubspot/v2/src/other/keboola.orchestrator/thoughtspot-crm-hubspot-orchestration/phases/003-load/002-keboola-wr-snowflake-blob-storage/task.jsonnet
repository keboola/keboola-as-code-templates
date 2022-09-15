{
  name: "keboola.wr-snowflake-blob-storage-" + ConfigId("out-thoughtspot-hubspot-snowflake-writer"),
  task: {
    mode: "run",
    configPath: "<common>/out-thoughtspot-hubspot-snowflake/v0/src/writer/keboola.wr-snowflake-blob-storage/out-thoughtspot-hubspot-snowflake-writer",
  },
  continueOnFailure: false,
  enabled: true,
}
