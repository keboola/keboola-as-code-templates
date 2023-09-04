{
  name: "keboola.snowflake-transformation-" + ConfigId("transformation-in-mailchimp"),
  task: {
    mode: "run",
    configPath: "<common>/in-mailchimp/transformation/keboola.snowflake-transformation/transformation-in-mailchimp",
  },
  continueOnFailure: false,
  enabled: true,
}
