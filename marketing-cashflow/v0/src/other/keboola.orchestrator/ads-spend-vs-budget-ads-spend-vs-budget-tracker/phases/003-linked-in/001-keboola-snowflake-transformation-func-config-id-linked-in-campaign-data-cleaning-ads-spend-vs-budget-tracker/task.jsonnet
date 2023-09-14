{
  name: "keboola.snowflake-transformation-" + ConfigId("linked-in-campaign-data-cleaning-ads-spend-vs-budget-tracker"),
  enabled: true,
  task: {
    mode: "run",
    configPath: "transformation/keboola.snowflake-transformation/linked-in-campaign-data-cleaning-ads-spend-vs-budget-tracker",
  },
  continueOnFailure: false,
}
