{
  name: "keboola.wr-google-bigquery-v2-" + ConfigId("out-thoughtspot-hubspot-bigquery-writer"),
  task: {
    mode: "run",
    configPath: "<common>/out-thoughtspot-hubspot-bigquery/v0/src/writer/keboola.wr-google-bigquery-v2/out-thoughtspot-hubspot-bigquery-writer",
  },
  continueOnFailure: false,
  enabled: true,
}
