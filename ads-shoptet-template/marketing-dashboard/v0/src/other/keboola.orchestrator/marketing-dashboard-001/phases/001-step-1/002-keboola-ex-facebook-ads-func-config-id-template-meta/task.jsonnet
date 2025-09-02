{
  name: "keboola.ex-facebook-ads-" + ConfigId("template-meta"),
  enabled: true,
  task: {
    mode: "run",
    configPath: "extractor/keboola.ex-facebook-ads/template-meta",
  },
  continueOnFailure: false,
}
