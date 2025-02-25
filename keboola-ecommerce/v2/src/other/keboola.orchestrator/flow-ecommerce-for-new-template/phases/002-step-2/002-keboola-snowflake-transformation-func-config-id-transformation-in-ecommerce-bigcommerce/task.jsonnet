{
  name: "keboola.snowflake-transformation-" + ConfigId("transformation-in-ecommerce-bigcommerce"),
  enabled: true,
  task: {
    mode: "run",
    configPath: "<common>/in-ecommerce-bigcommerce/v0/src/transformation/keboola.snowflake-transformation/transformation-in-ecommerce-bigcommerce",
  },
  continueOnFailure: false,
}
