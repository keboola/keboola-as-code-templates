{
  name: "keboola.ex-http-" + ConfigId("seed-breweries"),
  enabled: true,
  task: {
    mode: "run",
    configPath: "extractor/keboola.ex-http/seed-breweries",
  },
  continueOnFailure: false,
}
