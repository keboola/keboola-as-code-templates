{
  name: "keboola.snowflake-transformation-" + ConfigId("in-googleanalytics4-transformation"),
  enabled: true,
  task: {
    mode: "run",
    configPath: "<common>/in-googleanalytics4/v0/src/transformation/keboola.snowflake-transformation/in-googleanalytics4-transformation",
  },
  continueOnFailure: false,
}
