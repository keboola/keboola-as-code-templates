{
  name: "keboola.snowflake-transformation-" + ConfigId("tik-tok-campaign-data-cleaning-ads-spend-vs-budget-tracker"),
  enabled: true,
  task: {
    mode: "run",
    configPath: "transformation/keboola.snowflake-transformation/tik-tok-campaign-data-cleaning-ads-spend-vs-budget-tracker",
  },
  continueOnFailure: false,
}
