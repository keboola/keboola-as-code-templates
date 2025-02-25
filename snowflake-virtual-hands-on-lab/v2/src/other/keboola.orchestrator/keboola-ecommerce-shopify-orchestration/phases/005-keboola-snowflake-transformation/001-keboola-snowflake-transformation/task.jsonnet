{
  name: "keboola.snowflake-transformation-" + ConfigId("in-ecommerce-sklik-transformation"),
  task: {
    mode: "run",
    configPath: "<common>/in-ecommerce-sklik/v0/src/transformation/keboola.snowflake-transformation/in-ecommerce-sklik-transformation",
  },
  continueOnFailure: false,
  enabled: true,
}
