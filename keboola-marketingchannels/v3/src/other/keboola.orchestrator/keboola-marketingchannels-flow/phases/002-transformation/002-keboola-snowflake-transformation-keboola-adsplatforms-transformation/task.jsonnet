{
  name: "keboola.snowflake-transformation-" + ConfigId("keboola-adsplatforms-transformation"),
  task: {
    mode: "run",
    configPath: "transformation/keboola.snowflake-transformation/keboola-adsplatforms-transformation",
  },
  continueOnFailure: false,
  enabled: true,
}
