{
  name: "keboola.google-bigquery-transformation-" + ConfigId("in-ecommerce-shopify-transformation1-prepare-input-tables"),
  task: {
    mode: "run",
    configPath: "<common>/in-ecommerce-shopify/v0/src/transformation/keboola.google-bigquery-transformation/demo-in-ecommerce-shopify-transformation1-prepare-input-tables",
  },
  continueOnFailure: false,
  enabled: true,
}
