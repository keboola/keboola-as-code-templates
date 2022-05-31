{
  name: "keboola.wr-google-sheets-" + ConfigId("gsheet-datastudio"),
  task: {
    mode: "run",
    configPath: "<common>/out-ecommerce-gsheet-datastudio/v0/src/writer/keboola.wr-google-sheets/gsheet-datastudio",
  },
  continueOnFailure: false,
  enabled: true,
}
