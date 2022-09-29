{
  name: "keboola.wr-snowflake-blob-storage-" + ConfigId("keboola-marketingchannels-snowflake-data-destination"),
  task: {
    mode: "run",
    configPath: "<common>/out-marketingchannels-snowflake/writer/keboola.wr-snowflake-blob-storage/keboola-marketingchannels-snowflake-data-destination",
  },
  continueOnFailure: false,
  enabled: true,
}
