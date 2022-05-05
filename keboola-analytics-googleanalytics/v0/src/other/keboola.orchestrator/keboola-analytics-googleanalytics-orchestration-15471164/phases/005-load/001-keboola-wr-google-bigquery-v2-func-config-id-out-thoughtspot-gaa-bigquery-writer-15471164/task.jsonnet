{
  name: "keboola.wr-google-bigquery-v2-" + ConfigId("out-googleanalytics-bigquery-writer"),
  task: {
    mode: "run",
    configPath: "<common>/out-googleanalytics-bigquery/v0/src/writer/keboola.wr-google-bigquery-v2/out-googleanalytics-bigquery-writer",
  },
  continueOnFailure: false,
  enabled: true,
}
