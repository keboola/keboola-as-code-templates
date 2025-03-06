{
  name: "keboola.google-bigquery-transformation-" + ConfigId("keboola-advertising-platforms-transformation"),
  task: {
    mode: "run",
    configPath: "transformation/keboola.google-bigquery-transformation/keboola-advertising-platforms-transformation",
  },
  continueOnFailure: false,
  enabled: true,
}
