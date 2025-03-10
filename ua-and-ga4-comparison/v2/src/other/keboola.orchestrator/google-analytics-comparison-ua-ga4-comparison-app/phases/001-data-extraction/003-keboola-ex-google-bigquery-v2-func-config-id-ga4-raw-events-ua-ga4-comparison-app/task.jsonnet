{
  name: "keboola.ex-google-bigquery-v2-" + ConfigId("ga4-raw-events-ua-ga4-comparison-app"),
  enabled: true,
  task: {
    mode: "run",
    configPath: "extractor/keboola.ex-google-bigquery-v2/ga4-raw-events-ua-ga4-comparison-app",
  },
  continueOnFailure: false,
}
