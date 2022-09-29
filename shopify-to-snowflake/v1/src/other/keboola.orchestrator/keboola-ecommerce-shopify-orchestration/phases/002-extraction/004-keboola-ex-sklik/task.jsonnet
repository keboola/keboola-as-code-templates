{
  name: "keboola.ex-sklik-" + ConfigId("in-ecommerce-sklik-extractor"),
  task: {
    mode: "run",
    configPath: "<common>/in-ecommerce-sklik/v0/src/extractor/keboola.ex-sklik/in-ecommerce-sklik-extractor",
  },
  continueOnFailure: false,
  enabled: true,
}
