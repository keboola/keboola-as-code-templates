{
  name: "keboola.wr-google-bigquery-v2-" + ConfigId("keboola-marketingchannels-bigquery-data-destination"),
  task: {
    mode: "run",
    configPath: "<common>/out-marketingchannels-bigquery/writer/keboola.wr-google-bigquery-v2/keboola-marketingchannels-bigquery-data-destination",
  },
  continueOnFailure: false,
  enabled: true,
}
