{
  name: "keboola.wr-google-bigquery-v2-" + ConfigId("data-destination-out-ecommerce-bigquery"),
  enabled: true,
  task: {
    mode: "run",
    configPath: "<common>/out-ecommerce-snowflake/v1/src/writer/keboola.wr-snowflake-blob-storage/data-destination-out-ecommerce-snowflake",
  },
  continueOnFailure: false,
}
