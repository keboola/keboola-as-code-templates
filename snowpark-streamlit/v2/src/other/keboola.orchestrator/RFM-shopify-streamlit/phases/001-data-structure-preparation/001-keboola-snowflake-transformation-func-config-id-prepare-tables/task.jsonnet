{
  name: "keboola.snowflake-transformation-" + ConfigId("prepare-input-tables"),
  enabled: true,
  continueOnFailure: false,
  task: {
    mode: "run",
    configPath: "transformation/keboola.snowflake-transformation/prepare-input-tables",
  },
}
