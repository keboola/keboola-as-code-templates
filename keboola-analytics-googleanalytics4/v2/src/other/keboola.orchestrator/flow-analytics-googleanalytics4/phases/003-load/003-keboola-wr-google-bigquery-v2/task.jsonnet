{
  name: "keboola.wr-google-bigquery-v2-" + ConfigId("data-destination-out-googleanalytics4-bigquery"),
  enabled: true,
  task: {
    mode: "run",
    configPath: "<common>/out-googleanalytics4-bigquery/v0/src/writer/keboola.wr-google-bigquery-v2/data-destination-out-googleanalytics4-bigquery",
  },
  continueOnFailure: false,
}
