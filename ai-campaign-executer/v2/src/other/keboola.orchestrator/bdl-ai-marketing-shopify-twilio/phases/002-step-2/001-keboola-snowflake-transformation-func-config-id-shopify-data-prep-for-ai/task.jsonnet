{
  name: "keboola.snowflake-transformation-" + ConfigId("shopify-data-prep-for-ai"),
  enabled: true,
  task: {
    mode: "run",
    configPath: "transformation/keboola.snowflake-transformation/shopify-data-prep-for-ai",
  },
  continueOnFailure: false,
}
