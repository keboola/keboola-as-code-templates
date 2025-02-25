{
  name: "keboola.ex-facebook-ads-" + ConfigId("in-ecommerce-facebook-extractor"),
  task: {
    mode: "run",
    configPath:  "<common>/in-ecommerce-facebook/v0/src/extractor/keboola.ex-facebook-ads/in-ecommerce-facebook-extractor",
  },
  continueOnFailure: false,
  enabled: true,
}
