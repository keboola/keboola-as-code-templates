{
  name: "keboola.google-bigquery-transformation-" + ConfigId("transformation-lineage-in-datahub-without-ex-org"),
  enabled: true,
  task: {
    mode: "run",
    configPath: "transformation/keboola.google-bigquery-transformation/transformation-lineage-in-datahub-without-ex-org",
  },
  continueOnFailure: false,
}
