{
  name: "keboola.ex-sample-data-" + ConfigId("import-shopify-demo-data"),
  enabled: true,
  continueOnFailure: false,
  task: {
    mode: "run",
    configPath: "extractor/keboola.ex-sample-data/import-shopify-demo-data",
  },
}
