{
  name: "keboola.wr-snowflake-" + ConfigId("out-thoughtspot-hubspot-snowflake-writer"),
  task: {
    mode: "run",
    configPath: "<common>/out-thoughtspot-hubspot-snowflake/v0/src/writer/keboola.wr-snowflake/out-thoughtspot-hubspot-snowflake-writer",
  },
  continueOnFailure: false,
  enabled: true,
}
