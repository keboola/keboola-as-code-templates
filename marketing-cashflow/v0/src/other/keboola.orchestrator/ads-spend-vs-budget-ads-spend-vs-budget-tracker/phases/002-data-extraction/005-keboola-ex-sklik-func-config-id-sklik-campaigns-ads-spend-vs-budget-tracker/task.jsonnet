{
  name: "keboola.ex-sklik-" + ConfigId("sklik-campaigns-ads-spend-vs-budget-tracker"),
  enabled: true,
  task: {
    mode: "run",
    configPath: "extractor/keboola.ex-sklik/sklik-campaigns-ads-spend-vs-budget-tracker",
  },
  continueOnFailure: false,
}
