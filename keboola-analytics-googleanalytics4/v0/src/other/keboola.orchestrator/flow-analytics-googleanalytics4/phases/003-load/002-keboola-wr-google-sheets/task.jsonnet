{
  name: "keboola.wr-google-sheets-" + ConfigId("data-destination-out-googleanalytics4-gsheet"),
  enabled: true,
  task: {
    mode: "run",
    configPath: "<common>/out-googleanalytics4-gsheet/v0/src/writer/keboola.wr-google-sheets/data-destination-out-googleanalytics4-gsheet",
  },
  continueOnFailure: false,
}
