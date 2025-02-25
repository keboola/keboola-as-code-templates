{
  name: "keboola.google-bigquery-transformation-" + ConfigId("data-preparation-cleaning"),
  enabled: true,
  continueOnFailure: false,
  task: {
    mode: "run",
    configPath: "transformation/keboola.google-bigquery-transformation/data-preparation-cleaning",
  },
}
