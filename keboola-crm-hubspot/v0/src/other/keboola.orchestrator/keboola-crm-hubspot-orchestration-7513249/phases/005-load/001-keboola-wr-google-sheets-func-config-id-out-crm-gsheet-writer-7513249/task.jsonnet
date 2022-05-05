{
  name: "keboola.wr-google-sheets-" + ConfigId("out-crm-gsheet-writer"),
  task: {
    mode: "run",
    configPath: "<common>/out-crm-gsheet/v0/src/writer/keboola.wr-google-sheets/out-crm-gsheet-writer",
  },
  continueOnFailure: false,
  enabled: true,
}
