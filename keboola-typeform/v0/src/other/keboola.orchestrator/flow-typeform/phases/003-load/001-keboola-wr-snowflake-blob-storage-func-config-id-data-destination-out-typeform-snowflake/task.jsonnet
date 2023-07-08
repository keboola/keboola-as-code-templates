{
  name: "keboola.wr-snowflake-" + ConfigId("data-destination-out-typeform-snowflake"),
  task: {
    mode: "run",
    configPath: "<common>/out-typeform-snowflake/writer/keboola.wr-snowflake/data-destination-out-typeform-snowflake",
  },
  continueOnFailure: false,
  enabled: true,
}
