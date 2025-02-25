{
  name: "keboola.snowflake-transformation-" + ConfigId("transformation-in-mgmt-jira"),
  task: {
    mode: "run",
    configPath: "<common>/in-mgmt-jira/transformation/keboola.snowflake-transformation/transformation-in-mgmt-jira",
  },
  continueOnFailure: false,
  enabled: true,
}
