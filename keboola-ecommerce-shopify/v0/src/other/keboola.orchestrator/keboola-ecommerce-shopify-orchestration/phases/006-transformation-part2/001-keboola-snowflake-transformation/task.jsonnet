{
  name: "keboola.snowflake-transformation-" + ConfigId("in-ecommerce-shopify-transformation2-data-preparation"),
  task: {
    mode: "run",
    configPath: "<common>/in-ecommerce-shopify/v0/src/transformation/keboola.snowflake-transformation/in-ecommerce-shopify-transformation2-data-preparation",
  },
  continueOnFailure: false,
  enabled: true,
}
