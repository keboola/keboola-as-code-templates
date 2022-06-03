{
  name: "keboola.wr-google-sheets-" + ConfigId("keboola-marketingchannels-googlesheet-data-destination"),
  task: {
    mode: "run",
    configPath: "<common>/out-marketingchannels-gsheet/writer/keboola.wr-google-sheets/keboola-marketingchannels-googlesheet-data-destination",
  },
  continueOnFailure: false,
  enabled: true,
}
