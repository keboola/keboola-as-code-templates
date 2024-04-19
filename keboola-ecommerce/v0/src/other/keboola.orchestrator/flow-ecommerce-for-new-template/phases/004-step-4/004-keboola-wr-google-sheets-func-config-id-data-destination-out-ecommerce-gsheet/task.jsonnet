{
  name: "keboola.wr-google-sheets-" + ConfigId("data-destination-out-ecommerce-gsheet"),
  enabled: true,
  task: {
    mode: "run",
    configPath: "<common>/out-ecommerce-gsheet/v1/src/writer/keboola.wr-google-sheets/data-destination-out-ecommerce-gsheet",
  },
  continueOnFailure: false,
}
