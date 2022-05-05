{
  name: "keboola.snowflake-transformation-" + ConfigId("in-ecommerce-shopify-transformation1-prepare-input-tables"),
  task: {
    mode: "run",
    configPath: "<common>/in-ecommerce-shopify/v0/src/transformation/keboola.snowflake-transformation/in-ecommerce-shopify-transformation1-prepare-input-tables",
  },
  continueOnFailure: false,
  enabled: true,
}
