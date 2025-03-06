{
  name: "keboola.google-bigquery-transformation-" + ConfigId("RFM-analysis"),
  enabled: true,
  continueOnFailure: false,
  task: {
    mode: "run",
    configPath: "transformation/keboola.google-bigquery-transformation/RFM-analysis",
  },
}
