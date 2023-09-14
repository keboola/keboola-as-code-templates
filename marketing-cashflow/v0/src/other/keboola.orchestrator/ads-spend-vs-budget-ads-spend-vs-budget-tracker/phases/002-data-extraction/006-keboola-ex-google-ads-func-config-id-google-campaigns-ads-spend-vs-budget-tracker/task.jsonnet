{
  name: "keboola.ex-google-ads-" + ConfigId("google-campaigns-ads-spend-vs-budget-tracker"),
  enabled: true,
  task: {
    mode: "run",
    configPath: "extractor/keboola.ex-google-ads/google-campaigns-ads-spend-vs-budget-tracker",
  },
  continueOnFailure: false,
}
