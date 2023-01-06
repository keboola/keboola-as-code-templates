{
  name: "keboola.ex-http-" + ConfigId("seed-beers"),
  enabled: true,
  task: {
    mode: "run",
    configPath: "extractor/keboola.ex-http/seed-beers",
  },
  continueOnFailure: false,
}
