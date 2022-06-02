{
  name: "keboola.wr-snowflake-blob-storage-" + ConfigId("data-destination-out-mgmt-snowflake"),
  task: {
    mode: "run",
    configPath: "<common>/out-mgmt-snowflake/writer/keboola.wr-snowflake-blob-storage/data-destination-out-mgmt-snowflake",
  },
  continueOnFailure: false,
  enabled: true,
}
