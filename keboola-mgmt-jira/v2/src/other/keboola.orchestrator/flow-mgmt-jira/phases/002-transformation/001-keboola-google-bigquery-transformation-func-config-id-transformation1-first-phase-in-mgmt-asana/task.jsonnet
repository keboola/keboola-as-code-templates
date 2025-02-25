{
  name: "keboola.google-bigquery-transformation-" + ConfigId("transformation-in-mgmt-jira"),
  task: {
    mode: "run",
    configPath: "<common>/in-mgmt-jira/transformation/keboola.google-bigquery-transformation/transformation-in-mgmt-jira",
  },
  continueOnFailure: false,
  enabled: true,
}
