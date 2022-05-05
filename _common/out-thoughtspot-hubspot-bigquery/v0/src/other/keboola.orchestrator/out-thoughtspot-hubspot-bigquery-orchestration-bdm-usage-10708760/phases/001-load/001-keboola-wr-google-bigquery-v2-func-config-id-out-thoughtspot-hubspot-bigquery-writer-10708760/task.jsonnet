{
  name: "keboola.wr-google-bigquery-v2-" + ConfigId("out-thoughtspot-hubspot-bigquery-writer"),
  task: {
    mode: "run",
    configPath: "writer/keboola.wr-google-bigquery-v2/out-thoughtspot-hubspot-bigquery-writer",
  },
  continueOnFailure: false,
  enabled: true,
}
