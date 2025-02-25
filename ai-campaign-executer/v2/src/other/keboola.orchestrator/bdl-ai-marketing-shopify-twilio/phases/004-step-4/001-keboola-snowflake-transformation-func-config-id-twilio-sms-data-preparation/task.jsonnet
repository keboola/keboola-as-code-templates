{
  name: "keboola.snowflake-transformation-" + ConfigId("twilio-sms-data-preparation"),
  enabled: true,
  task: {
    mode: "run",
    configPath: "transformation/keboola.snowflake-transformation/twilio-sms-data-preparation",
  },
  continueOnFailure: false,
}
