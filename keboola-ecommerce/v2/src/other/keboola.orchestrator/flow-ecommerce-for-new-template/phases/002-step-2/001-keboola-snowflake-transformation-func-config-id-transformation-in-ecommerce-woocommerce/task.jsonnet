{
  name: "keboola.snowflake-transformation-" + ConfigId("transformation-in-ecommerce-woocommerce"),
  enabled: true,
  task: {
    mode: "run",
    configPath: "<common>/in-ecommerce-woocommerce/v0/src/transformation/keboola.snowflake-transformation/transformation-in-ecommerce-woocommerce",
  },
  continueOnFailure: false,
}
