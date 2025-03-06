{
  name: "keboola.ex-currency-" + ConfigId("ecb-currency-rates-ads-spend-vs-budget-tracker"),
  enabled: true,
  task: {
    mode: "run",
    configPath: "extractor/keboola.ex-currency/ecb-currency-rates-ads-spend-vs-budget-tracker",
  },
  continueOnFailure: false,
}
