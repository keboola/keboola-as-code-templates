{
  name: "keboola.snowflake-transformation-" + ConfigId("transformation1-input-tables-creation"),
  enabled: true,
  continueOnFailure: false,
  task: {
    mode: "run",
    configPath: "transformation/keboola.snowflake-transformation/transformation1-input-tables-creation",
  },
}
