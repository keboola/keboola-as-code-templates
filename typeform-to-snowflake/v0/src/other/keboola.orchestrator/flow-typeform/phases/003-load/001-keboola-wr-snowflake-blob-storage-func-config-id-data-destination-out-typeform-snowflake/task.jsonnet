{
  name: "keboola.wr-snowflake-blob-storage-" + ConfigId("data-destination-out-typeform-snowflake"),
  task: {
    mode: "run",
    configPath: "<common>/out-typeform-snowflake/writer/keboola.wr-snowflake-blob-storage/data-destination-out-typeform-snowflake",
  },
  continueOnFailure: false,
  enabled: true,
}
