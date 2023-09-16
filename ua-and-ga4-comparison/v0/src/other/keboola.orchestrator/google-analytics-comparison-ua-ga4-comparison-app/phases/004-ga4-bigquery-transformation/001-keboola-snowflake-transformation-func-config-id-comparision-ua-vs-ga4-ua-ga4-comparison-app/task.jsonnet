{
  name: "keboola.snowflake-transformation-" + ConfigId("ga4-bigquery-ua-ga4-comparison-app"),
  enabled: true,
  task: {
    mode: "run",
    configPath: "transformation/keboola.snowflake-transformation/ga4-bigquery-ua-ga4-comparison-app",
  },
  continueOnFailure: false,
}
