{
  name: "keboola.wr-snowflake-blob-storage-" + ConfigId("snowflake-keboola-costs"),
  task: {
    mode: "run",
    configPath: "<common>/out-keboola-costs-snowflake/writer/keboola.wr-snowflake-blob-storage/snowflake-keboola-costs",
  },
  continueOnFailure: false,
  enabled: true,
}
