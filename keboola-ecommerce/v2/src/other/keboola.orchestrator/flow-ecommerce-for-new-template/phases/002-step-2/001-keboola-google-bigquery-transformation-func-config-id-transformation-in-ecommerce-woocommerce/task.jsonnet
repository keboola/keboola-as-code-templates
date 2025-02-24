{
  name: "keboola.google-bigquery-transformation-" + ConfigId("transformation-in-ecommerce-woocommerce"),
  enabled: true,
  task: {
    mode: "run",
    configPath: "<common>/in-ecommerce-woocommerce/v0/src/transformation/keboola.google-bigquery-transformation/transformation-in-ecommerce-woocommerce",
  },
  continueOnFailure: false,
}
