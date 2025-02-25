{
  name: "keboola.wr-google-sheets-" + ConfigId("data-destination-out-typeform-gsheet"),
  task: {
    mode: "run",
    configPath: "<common>/out-typeform-gsheet/writer/keboola.wr-google-sheets/data-destination-out-typeform-gsheet",
  },
  continueOnFailure: false,
  enabled: true,
}
