{
  name: "keboola.wr-snowflake-" + ConfigId("out-thoughtspot-gaa-snowflake-writer"),
  task: {
    mode: "run",
    configPath: "writer/keboola.wr-snowflake/out-thoughtspot-gaa-snowflake-writer",
  },
  continueOnFailure: false,
  enabled: true,
}
