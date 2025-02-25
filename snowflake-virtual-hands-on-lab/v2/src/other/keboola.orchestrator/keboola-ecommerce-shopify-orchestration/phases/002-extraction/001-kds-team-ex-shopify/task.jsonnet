{
  name: "keboola.ex-sample-data-"+ ConfigId("in-ecommerce-shopify-extractor"),
  task: {
    mode: "run",
    configPath: "<common>/in-ecommerce-shopify/v0/src/extractor/keboola.ex-sample-data/demo-data",
  },
  continueOnFailure: false,
  enabled: true,
}
