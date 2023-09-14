{
  name: "keboola.snowflake-transformation-" + ConfigId("sklik-campaign-data-cleaning-ads-spend-vs-budget-tracker"),
  enabled: true,
  task: {
    mode: "run",
    configPath: "transformation/keboola.snowflake-transformation/sklik-campaign-data-cleaning-ads-spend-vs-budget-tracker",
  },
  continueOnFailure: false,
}
