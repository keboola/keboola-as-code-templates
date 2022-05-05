{
  name: "keboola.ex-google-analytics-v4-" + ConfigId("in-googleanalytics-extractor"),
  continueOnFailure: false,
  enabled: true,
  task: {
    mode: "run",
    configPath: "<common>/in-googleanalytics/v0/src/extractor/keboola.ex-google-analytics-v4/in-googleanalytics-extractor",
  },
}
