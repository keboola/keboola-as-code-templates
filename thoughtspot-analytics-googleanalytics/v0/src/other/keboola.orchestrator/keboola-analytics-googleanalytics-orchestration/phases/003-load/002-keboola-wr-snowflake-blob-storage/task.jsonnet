{
  name: "keboola.wr-snowflake-blob-storage-" + ConfigId("out-googleanalytics-snowflake-writer"),
  task: {
    mode: "run",
    configPath: "<common>/out-thoughtspot-googleanalytics-snowflake/v0/src/writer/keboola.wr-snowflake-blob-storage/out-thoughtspot-gaa-snowflake-writer",
  },
  continueOnFailure: false,
  enabled: true,
}
