{
  name: "kds-team.ex-shopify-" + ConfigId("shopify-data-source"),
  enabled: true,
  task: {
    mode: "run",
    configPath: "extractor/kds-team.ex-shopify/shopify-data-source",
  },
  continueOnFailure: false,
}
