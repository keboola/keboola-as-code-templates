{
  name: "keboola.ex-google-ads-" + ConfigId("in-ecommerce-googleads-extractor"),
  task: {
    mode: "run",
    configPath: "<common>/in-ecommerce-googleads/v0/src/extractor/keboola.ex-google-ads/in-ecommerce-googleads-extractor",
  },
  continueOnFailure: false,
  enabled: true,
}
