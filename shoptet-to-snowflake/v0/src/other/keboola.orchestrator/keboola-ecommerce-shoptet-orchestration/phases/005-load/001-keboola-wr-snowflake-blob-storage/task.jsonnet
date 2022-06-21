{
  name: "keboola.wr-snowflake-blob-storage-" + ConfigId("out-ecommerce-snowflake-writer"),
  task: {
    mode: "run",
    configPath: "<common>/out-ecommerce-snowflake/v0/src/writer/keboola.wr-snowflake-blob-storage/out-ecommerce-snowflake-writer",
  },
  continueOnFailure: false,
  enabled: true,
}
