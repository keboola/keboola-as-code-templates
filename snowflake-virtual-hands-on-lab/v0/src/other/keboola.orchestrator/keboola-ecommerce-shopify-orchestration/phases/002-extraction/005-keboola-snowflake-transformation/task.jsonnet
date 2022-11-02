{
  name: "keboola.snowflake-transformation-" + ConfigId("in-ecommerce-shopify-transformation-tables-creation"),
  task: {
    mode: "run",
    configPath: "<common>/in-ecommerce-shopify/v0/src/transformation/keboola.snowflake-transformation/in-ecommerce-shopify-transformation-tables-creation",
  },
  continueOnFailure: false,
  enabled: true,
}
