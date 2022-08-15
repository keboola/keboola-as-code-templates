{
  name: "keboola.wr-google-bigquery-v2-" + ConfigId("data-destination-out-crm-bigquery"),
  task: {
    mode: "run",
    configPath: "<common>/out-crm-bigquery/v0/src/writer/keboola.wr-google-bigquery-v2/data-destination-out-crm-bigquery",
  },
  continueOnFailure: false,
  enabled: true,
}
