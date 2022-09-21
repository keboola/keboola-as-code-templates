{
  name: "keboola.wr-google-bigquery-v2-" + ConfigId("out-ecommerce-bigquery-writer"),
  task: {
    mode: "run",
    configPath: "<common>/out-ecommerce-bigquery/v0/src/writer/keboola.wr-google-bigquery-v2/out-ecommerce-bigquery-writer",
  },
  continueOnFailure: false,
  enabled: true,
}
