{
  name: "keboola.wr-google-sheets-" + ConfigId("data-destination-out-googleanalytics-gsheet"),
  task: {
    mode: "run",
    configPath: "<common>/out-googleanalytics-gsheet/v0/src/writer/keboola.wr-google-sheets/data-destination-out-googleanalytics-gsheet",
  },
  continueOnFailure: false,
  enabled: true,
}
