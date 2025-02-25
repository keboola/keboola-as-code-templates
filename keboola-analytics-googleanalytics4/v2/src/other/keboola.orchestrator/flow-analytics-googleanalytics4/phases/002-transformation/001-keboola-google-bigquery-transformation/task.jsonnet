{
  name: "keboola.google-bigquery-transformation-" + ConfigId("in-googleanalytics4-transformation"),
  enabled: true,
  task: {
    mode: "run",
    configPath: "<common>/in-googleanalytics4/v0/src/transformation/keboola.google-bigquery-transformation/in-googleanalytics4-transformation",
  },
  continueOnFailure: false,
}
