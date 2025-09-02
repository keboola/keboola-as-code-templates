{
  name: "keboola.ex-google-analytics-v4-" + ConfigId("template-ga"),
  enabled: true,
  task: {
    mode: "run",
    configPath: "extractor/keboola.ex-google-analytics-v4/template-ga",
  },
  continueOnFailure: false,
}
