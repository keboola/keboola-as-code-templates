{
  name: "keboola.ex-http-" + ConfigId("seed-extraction"),
  enabled: true,
  task: {
    mode: "run",
    configPath: "extractor/keboola.ex-http/seed-extraction",
  },
  continueOnFailure: false,
}
