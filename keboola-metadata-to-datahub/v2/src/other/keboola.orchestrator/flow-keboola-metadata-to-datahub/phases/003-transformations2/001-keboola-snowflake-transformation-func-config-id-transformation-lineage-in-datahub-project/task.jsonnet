{
  name: "keboola.snowflake-transformation-" + ConfigId("transformation-lineage-in-datahub-without-ex-project"),
  enabled: true,
  task: {
    mode: "run",
    configPath: "transformation/keboola.snowflake-transformation/transformation-lineage-in-datahub-without-ex-project",
  },
  continueOnFailure: false,
}
