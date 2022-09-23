{
  name: "keboola.wr-snowflake-" + ConfigId("out-googleanalytics-snowflake-writer"),
  task: {
    mode: "run",
    configPath: "<common>/out-thoughtspot-googleanalytics-snowflake/v0/src/writer/keboola.wr-snowflake/out-thoughtspot-gaa-snowflake-writer",
  },
  continueOnFailure: false,
  enabled: true,
}
