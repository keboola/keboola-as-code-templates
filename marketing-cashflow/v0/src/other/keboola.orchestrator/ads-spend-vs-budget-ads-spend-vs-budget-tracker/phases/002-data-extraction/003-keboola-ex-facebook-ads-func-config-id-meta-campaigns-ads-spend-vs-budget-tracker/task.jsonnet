{
  name: "keboola.ex-facebook-ads-" + ConfigId("meta-campaigns-ads-spend-vs-budget-tracker"),
  enabled: true,
  task: {
    mode: "run",
    configPath: "extractor/keboola.ex-facebook-ads/meta-campaigns-ads-spend-vs-budget-tracker",
  },
  continueOnFailure: false,
}
