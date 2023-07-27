{
  name: "keboola.wr-google-bigquery-v2-" + ConfigId("data-destination-out-social-media-engagement-bigquery"),
  enabled: true,
  task: {
    mode: "run",
    configPath: "writer/keboola.wr-google-bigquery-v2/out-social-media-engagement-bigquery-writer",
  },
  continueOnFailure: false,
}
