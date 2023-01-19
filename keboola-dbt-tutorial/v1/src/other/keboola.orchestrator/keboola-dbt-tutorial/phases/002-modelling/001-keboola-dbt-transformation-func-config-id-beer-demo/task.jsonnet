{
  name: "keboola.dbt-transformation-" + ConfigId("beer-demo"),
  enabled: true,
  task: {
    mode: "run",
    configPath: "transformation/keboola.dbt-transformation/beer-demo",
  },
  continueOnFailure: false,
}
