{
  name: "keboola.google-bigquery-transformation-" + ConfigId("in-googleanalytics-searchconsole-transformation"),
  task: {
    mode: "run",
    configPath: "<common>/in-googleanalytics-searchconsole/v0/src/transformation/keboola.google-bigquery-transformation/in-googleanalytics-searchconsole-transformation",
  },
  continueOnFailure: false,
  enabled: true,
}
