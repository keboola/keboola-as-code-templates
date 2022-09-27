{
  name: "keboola.wr-google-sheets-" + ConfigId("out-ecommerce-gsheet-writer"),
  task: {
    mode: "run",
    configPath: "<common>/out-ecommerce-gsheet/v0/src/writer/keboola.wr-google-sheets/out-ecommerce-gsheet-writer",
  },
  continueOnFailure: false,
  enabled: true,
}
