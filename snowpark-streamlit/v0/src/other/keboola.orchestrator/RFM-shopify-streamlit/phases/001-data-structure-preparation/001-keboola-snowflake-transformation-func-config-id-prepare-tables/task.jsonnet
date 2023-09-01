{
  name: "keboola.snowflake-transformation-" + ConfigId("prepare-tables"),
  enabled: true,
  continueOnFailure: false,
  task: {
    mode: "run",
    configPath: "transformation/keboola.snowflake-transformation/prepare-tables",
  },
}
