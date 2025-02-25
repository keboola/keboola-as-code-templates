{
  name: "keboola.wr-google-sheets-" + ConfigId("data-destination-out-mailchimp-gsheet"),
  task: {
    mode: "run",
    configPath: "<common>/out-mailchimp-googlesheet/writer/keboola.wr-google-sheets/data-destination-out-mailchimp-gsheet",
  },
  continueOnFailure: false,
  enabled: true,
}
