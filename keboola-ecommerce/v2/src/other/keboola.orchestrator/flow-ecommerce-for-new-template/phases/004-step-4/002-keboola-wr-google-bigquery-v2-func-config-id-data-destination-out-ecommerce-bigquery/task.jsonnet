{
  name: "keboola.wr-google-bigquery-v2-" + ConfigId("data-destination-out-ecommerce-bigquery"),
  enabled: true,
  task: {
    mode: "run",
    configPath: "<common>/out-ecommerce-bigquery/v1/src/writer/keboola.wr-google-bigquery-v2/data-destination-out-ecommerce-bigquery",
  },
  continueOnFailure: false,
}
