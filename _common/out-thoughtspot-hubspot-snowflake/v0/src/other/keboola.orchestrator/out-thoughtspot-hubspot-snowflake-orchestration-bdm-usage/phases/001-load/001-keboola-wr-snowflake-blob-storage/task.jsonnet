{
  name: "keboola.wr-snowflake-" + ConfigId("out-thoughtspot-hubspot-snowflake-writer"),
  task: {
    mode: "run",
    configPath: "writer/keboola.wr-snowflake/out-thoughtspot-hubspot-snowflake-writer",
  },
  continueOnFailure: false,
  enabled: true,
}
