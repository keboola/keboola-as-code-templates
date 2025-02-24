{
  name: "keboola.google-bigquery-transformation-" + ConfigId("ga4-bigquery-ua-ga4-comparison-app"),
  enabled: true,
  task: {
    mode: "run",
    configPath: "transformation/keboola.google-bigquery-transformation/ga4-bigquery-ua-ga4-comparison-app",
  },
  continueOnFailure: false,
}
