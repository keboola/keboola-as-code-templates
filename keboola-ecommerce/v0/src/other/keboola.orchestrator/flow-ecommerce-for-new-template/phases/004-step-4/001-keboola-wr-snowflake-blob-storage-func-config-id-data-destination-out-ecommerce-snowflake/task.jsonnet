{
  name: "keboola.wr-snowflake-blob-storage-" + ConfigId("data-destination-out-ecommerce-snowflake"),
  enabled: true,
  task: {
    mode: "run",
    configPath: "<common>/out-ecommerce-bigquery/v1/src/writer/keboola.wr-google-bigquery-v2/data-destination-out-ecommerce-bigquery",
  },
  continueOnFailure: false,
}
