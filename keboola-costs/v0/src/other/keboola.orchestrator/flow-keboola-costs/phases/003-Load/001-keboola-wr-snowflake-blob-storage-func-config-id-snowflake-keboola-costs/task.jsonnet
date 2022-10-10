{
  name: "keboola.wr-snowflake-" + ConfigId("snowflake-keboola-costs"),
  task: {
    mode: "run",
    configPath: "<common>/out-keboola-costs-snowflake/writer/keboola.wr-snowflake/snowflake-keboola-costs",
  },
  continueOnFailure: false,
  enabled: true,
}
