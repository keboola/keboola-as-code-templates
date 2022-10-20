{
  name: "keboola.snowflake-transformation-" + ConfigId("transformation-lineage-in-datahub-with-ex"),
  enabled: true,
  task: {
    mode: "run",
    configPath: "transformation/keboola.snowflake-transformation/transformation-lineage-in-datahub-with-ex",
  },
  continueOnFailure: false,
}
