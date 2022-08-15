{
  name: "keboola.wr-google-bigquery-v2-" + ConfigId("data-destination-out-keboola-costs-bigquery"),
  task: {
    mode: "run",
    configPath: "<common>/out-keboola-costs-bigquery/v0/src/writer/keboola.wr-google-bigquery-v2/data-destination-out-keboola-costs-bigquery",
  },
  continueOnFailure: false,
  enabled: true,
}
