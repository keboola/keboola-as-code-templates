{
  name: "keboola.wr-google-sheets-" + ConfigId("google-sheets-keboola-costs"),
  task: {
    mode: "run",
    configPath: "<common>/out-keboola-costs-gsheet/writer/keboola.wr-google-sheets/google-sheets-keboola-costs",
  },
  continueOnFailure: false,
  enabled: true,
}
