{
  name: "keboola.wr-google-sheets-" + ConfigId("gsheet-datastudio-transformation"),
  task: {
    mode: "run",
    configPath: "<common>/out-ecommerce-gsheet-datastudio/v0/src/transformation/keboola.snowflake-transformation/gsheet-datastudio-transformation",
  },
  continueOnFailure: false,
  enabled: true,
}
