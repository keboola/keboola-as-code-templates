{
  name: "keboola.google-bigquery-transformation-" + ConfigId("transformation-flow-lineage-in-datahub-without-ex-project"),
  enabled: true,
  task: {
    mode: "run",
    configPath: "transformation/keboola.google-bigquery-transformation/transformation-flow-lineage-in-datahub-without-ex-project",
  },
  continueOnFailure: false,
}
