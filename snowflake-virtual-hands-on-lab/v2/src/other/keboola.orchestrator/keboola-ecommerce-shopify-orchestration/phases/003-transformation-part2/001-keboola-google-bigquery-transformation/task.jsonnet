{
  name: "keboola.google-bigquery-transformation-" + ConfigId("in-ecommerce-shopify-transformation2-data-preparation"),
  task: {
    mode: "run",
    configPath: "<common>/in-ecommerce-shopify/v0/src/transformation/keboola.google-bigquery-transformation/demo-in-ecommerce-shopify-transformation2-data-preparation",
  },
  continueOnFailure: false,
  enabled: true,
}
