{
  name: "keboola.wr-snowflake-" + ConfigId("out-crm-snowflake-writer"),
  task: {
    mode: "run",
    configPath: "<common>/out-crm-snowflake/v0/src/writer/keboola.wr-snowflake/out-crm-snowflake-writer",
  },
  continueOnFailure: false,
  enabled: true,
}
