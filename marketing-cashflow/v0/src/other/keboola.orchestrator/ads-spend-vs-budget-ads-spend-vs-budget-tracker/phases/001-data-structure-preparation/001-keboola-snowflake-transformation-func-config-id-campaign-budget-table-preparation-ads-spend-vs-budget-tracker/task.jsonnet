{
  name: "keboola.snowflake-transformation-" + ConfigId("campaign-budget-table-preparation-ads-spend-vs-budget-tracker"),
  enabled: true,
  task: {
    mode: "run",
    configPath: "transformation/keboola.snowflake-transformation/campaign-budget-table-preparation-ads-spend-vs-budget-tracker",
  },
  continueOnFailure: false,
}
