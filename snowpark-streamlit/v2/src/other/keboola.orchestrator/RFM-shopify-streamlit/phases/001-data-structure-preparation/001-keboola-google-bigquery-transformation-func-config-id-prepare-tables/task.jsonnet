{
  name: "keboola.google-bigquery-transformation-" + ConfigId("prepare-input-tables"),
  enabled: true,
  continueOnFailure: false,
  task: {
    mode: "run",
    configPath: "transformation/keboola.google-bigquery-transformation/prepare-input-tables",
  },
}
