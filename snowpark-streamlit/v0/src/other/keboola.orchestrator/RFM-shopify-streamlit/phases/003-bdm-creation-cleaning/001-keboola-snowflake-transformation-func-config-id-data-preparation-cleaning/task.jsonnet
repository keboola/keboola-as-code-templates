{
  name: "keboola.snowflake-transformation-" + ConfigId("data-preparation-cleaning"),
  enabled: true,
  continueOnFailure: false,
  task: {
    mode: "run",
    configPath: "transformation/keboola.snowflake-transformation/data-preparation-cleaning",
  },
}
