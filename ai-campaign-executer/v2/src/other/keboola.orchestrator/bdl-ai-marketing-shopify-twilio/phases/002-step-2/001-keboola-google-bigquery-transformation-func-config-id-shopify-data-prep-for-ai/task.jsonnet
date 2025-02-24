{
  name: "keboola.google-bigquery-transformation-" + ConfigId("shopify-data-prep-for-ai"),
  enabled: true,
  task: {
    mode: "run",
    configPath: "transformation/keboola.google-bigquery-transformation/shopify-data-prep-for-ai",
  },
  continueOnFailure: false,
}
