{
  name: "keboola.snowflake-transformation-" + ConfigId("transformation2-main"),
  enabled: true,
  continueOnFailure: false,
  task: {
    mode: "run",
    configPath: "transformation/keboola.snowflake-transformation/transformation2-main",
  },
}
