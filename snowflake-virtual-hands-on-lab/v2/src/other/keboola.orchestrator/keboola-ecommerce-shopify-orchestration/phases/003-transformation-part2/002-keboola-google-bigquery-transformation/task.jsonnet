{
  name: "keboola.google-bigquery-transformation-" + ConfigId("in-ecommerce-facebook-transformation"),
  task: {
    mode: "run",
    configPath: "<common>/in-ecommerce-facebook/v0/src/transformation/keboola.google-bigquery-transformation/in-ecommerce-facebook-transformation",
  },
  continueOnFailure: false,
  enabled: true,
}
