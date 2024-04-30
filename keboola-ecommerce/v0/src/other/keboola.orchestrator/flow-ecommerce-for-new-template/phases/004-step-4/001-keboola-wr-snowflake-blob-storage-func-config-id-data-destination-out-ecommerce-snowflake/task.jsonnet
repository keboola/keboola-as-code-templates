{
  name: "keboola.wr-snowflake-blob-storage-" + ConfigId("data-destination-out-ecommerce-snowflake"),
  enabled: true,
  task: {
    mode: "run",
    configPath: "<common>/out-ecommerce-snowflake/v1/src/writer/keboola.wr-snowflake-blob-storage/data-destination-out-ecommerce-snowflake",
  },
  continueOnFailure: false,
}
