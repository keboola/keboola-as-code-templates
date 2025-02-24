{
  name: "keboola.wr-google-bigquery-v2-" + ConfigId("data-destination-out-git-bigquery"),
  task: {
    mode: "run",
    configPath: "<common>/out-git-bigquery/writer/keboola.wr-google-bigquery-v2/data-destination-out-git-bigquery",
  },
  continueOnFailure: false,
  enabled: true,
}
