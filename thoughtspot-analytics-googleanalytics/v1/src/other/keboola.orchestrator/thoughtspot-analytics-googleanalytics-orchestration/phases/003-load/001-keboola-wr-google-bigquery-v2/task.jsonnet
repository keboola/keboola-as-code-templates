{
  name: "keboola.wr-google-bigquery-v2-" + ConfigId("out-googleanalytics-bigquery-writer"),
  task: {
    mode: "run",
    configPath: "<common>/out-thoughtspot-googleanalytics-bigquery/v0/src/writer/keboola.wr-google-bigquery-v2/out-thoughtspot-gaa-bigquery-writer",
  },
  continueOnFailure: false,
  enabled: true,
}
