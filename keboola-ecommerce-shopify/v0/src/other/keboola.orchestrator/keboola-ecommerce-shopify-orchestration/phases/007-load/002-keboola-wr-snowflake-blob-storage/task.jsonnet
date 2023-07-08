{
  name: "keboola.wr-snowflake-" + ConfigId("out-ecommerce-snowflake-writer"),
  task: {
    mode: "run",
    configPath: "<common>/out-ecommerce-snowflake/v0/src/writer/keboola.wr-snowflake/out-ecommerce-snowflake-writer",
  },
  continueOnFailure: false,
  enabled: true,
}
