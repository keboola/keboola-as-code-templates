{
  name: "keboola.wr-snowflake-" + ConfigId("data-destination-out-mgmt-snowflake"),
  task: {
    mode: "run",
    configPath: "<common>/out-mgmt-snowflake/writer/keboola.wr-snowflake/data-destination-out-mgmt-snowflake",
  },
  continueOnFailure: false,
  enabled: true,
}
