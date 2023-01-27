{
  name: "keboola.wr-google-bigquery-v2-" + ConfigId("data-destination-out-typeform-bigquery"),
  task: {
    mode: "run",
    configPath: "<common>/out-typeform-bigquery/writer/keboola.wr-google-bigquery-v2/data-destination-out-typeform-bigquery",
  },
  continueOnFailure: false,
  enabled: true,
}
