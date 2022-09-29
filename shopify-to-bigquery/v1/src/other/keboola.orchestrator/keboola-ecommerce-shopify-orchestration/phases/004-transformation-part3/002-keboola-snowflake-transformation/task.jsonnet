{
  name: "keboola.snowflake-transformation-" + ConfigId("in-ecommerce-googleads-transformation"),
  task: {
    mode: "run",
    configPath: "<common>/in-ecommerce-googleads/v0/src/transformation/keboola.snowflake-transformation/in-ecommerce-googleads-transformation",
  },
  continueOnFailure: false,
  enabled: true,
}
