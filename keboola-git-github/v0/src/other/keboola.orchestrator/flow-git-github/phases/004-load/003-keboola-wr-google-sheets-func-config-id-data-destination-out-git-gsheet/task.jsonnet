{
  name: "keboola.wr-google-sheets-" + ConfigId("data-destination-out-git-gsheet"),
  task: {
    mode: "run",
    configPath: "<common>/out-git-gsheet/writer/keboola.wr-google-sheets/data-destination-out-git-gsheet",
  },
  continueOnFailure: false,
  enabled: true,
}
