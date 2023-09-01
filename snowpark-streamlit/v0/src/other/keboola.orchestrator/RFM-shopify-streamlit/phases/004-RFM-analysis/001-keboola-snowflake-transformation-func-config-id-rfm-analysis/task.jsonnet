{
  name: "keboola.snowflake-transformation-" + ConfigId("rfm-analysis"),
  enabled: true,
  continueOnFailure: false,
  task: {
    mode: "run",
    configPath: "transformation/keboola.snowflake-transformation/rfm-analysis",
  },
}
