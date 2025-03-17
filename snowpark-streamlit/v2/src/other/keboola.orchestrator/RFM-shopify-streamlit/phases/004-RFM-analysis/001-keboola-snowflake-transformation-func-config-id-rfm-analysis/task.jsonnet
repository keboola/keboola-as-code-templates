{
  name: "keboola.snowflake-transformation-" + ConfigId("RFM-analysis"),
  enabled: true,
  continueOnFailure: false,
  task: {
    mode: "run",
    configPath: "transformation/keboola.snowflake-transformation/RFM-analysis",
  },
}
