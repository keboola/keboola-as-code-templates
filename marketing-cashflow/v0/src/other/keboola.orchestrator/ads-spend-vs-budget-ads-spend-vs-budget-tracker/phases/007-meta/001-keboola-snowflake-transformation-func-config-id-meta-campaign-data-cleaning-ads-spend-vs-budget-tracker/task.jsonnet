{
  name: "keboola.snowflake-transformation-" + ConfigId("meta-campaign-data-cleaning-ads-spend-vs-budget-tracker"),
  enabled: true,
  task: {
    mode: "run",
    configPath: "transformation/keboola.snowflake-transformation/meta-campaign-data-cleaning-ads-spend-vs-budget-tracker",
  },
  continueOnFailure: false,
}
