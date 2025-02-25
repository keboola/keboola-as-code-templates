{
  name: "keboola.snowflake-transformation-" + ConfigId("transformation-flow-lineage-in-datahub-without-ex-project"),
  enabled: true,
  task: {
    mode: "run",
    configPath: "transformation/keboola.snowflake-transformation/transformation-flow-lineage-in-datahub-without-ex-project",
  },
  continueOnFailure: false,
}
