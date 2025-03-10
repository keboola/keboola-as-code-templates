{
  name: "keboola.snowflake-transformation-" + ConfigId("google-ads-campaign-data-cleaning-ads-spend-vs-budget-tracker"),
  enabled: true,
  task: {
    mode: "run",
    configPath: "transformation/keboola.snowflake-transformation/google-ads-campaign-data-cleaning-ads-spend-vs-budget-tracker",
  },
  continueOnFailure: false,
}
