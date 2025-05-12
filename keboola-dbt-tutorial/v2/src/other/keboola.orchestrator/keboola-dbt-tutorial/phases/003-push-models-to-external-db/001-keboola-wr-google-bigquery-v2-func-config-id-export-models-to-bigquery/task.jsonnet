{
  name: "keboola.wr-google-bigquery-v2-" + ConfigId("export-models-to-bigquery"),
  enabled: true,
  task: {
    mode: "run",
    configPath: "writer/keboola.wr-google-bigquery-v2/export-models-to-bigquery",
  },
  continueOnFailure: false,
}
