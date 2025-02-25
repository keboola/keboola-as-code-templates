{
  name: "keboola.wr-google-bigquery-v2-" + ConfigId("data-destination-out-mgmt-bigquery"),
  task: {
    mode: "run",
    configPath: "<common>/out-mgmt-bigquery/writer/keboola.wr-google-bigquery-v2/data-destination-out-mgmt-bigquery",
  },
  continueOnFailure: false,
  enabled: true,
}
