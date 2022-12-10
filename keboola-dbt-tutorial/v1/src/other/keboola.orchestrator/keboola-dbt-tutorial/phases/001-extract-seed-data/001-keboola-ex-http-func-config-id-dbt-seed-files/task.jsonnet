{
  name: "keboola.ex-http-" + ConfigId("dbt-seed-files"),
  enabled: true,
  task: {
    mode: "run",
    configPath: "extractor/keboola.ex-http/dbt-seed-files",
  },
  continueOnFailure: false,
}
