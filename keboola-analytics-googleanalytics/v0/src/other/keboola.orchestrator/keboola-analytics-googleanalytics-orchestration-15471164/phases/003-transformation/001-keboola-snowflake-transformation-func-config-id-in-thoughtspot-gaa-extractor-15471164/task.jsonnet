{
  name: "keboola.snowflake-transformation-" + ConfigId("in-googleanalytics-transformation"),
  continueOnFailure: false,
  enabled: true,
  task: {
    mode: "run",
    configPath: "<common>/in-googleanalytics/v0/src/transformation/keboola.snowflake-transformation/in-googleanalytics-transformation",
  },
}
