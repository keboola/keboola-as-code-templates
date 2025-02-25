{
  name: "keboola.ex-google-analytics-v4-" + ConfigId("in-googleanalytics4-extractor"),
  enabled: true,
  task: {
    mode: "run",
    configPath: "<common>/in-googleanalytics4/v0/src/extractor/keboola.ex-google-analytics-v4/in-googleanalytics4-extractor",
  },
  continueOnFailure: false,
}
