{
  name: "keboola.wr-snowflake-" + ConfigId("data-destination-out-googleanalytics4-snowflake"),
  enabled: true,
  task: {
    mode: "run",
    configPath: "<common>/out-googleanalytics4-snowflake/v0/src/writer/keboola.wr-snowflake-blob-storage/data-destination-out-googleanalytics4-snowflake",
  },
  continueOnFailure: false,
}
