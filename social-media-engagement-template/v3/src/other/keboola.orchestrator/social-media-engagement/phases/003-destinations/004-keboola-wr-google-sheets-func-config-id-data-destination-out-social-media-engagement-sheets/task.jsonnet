{
  name: "keboola.wr-google-sheets-" + ConfigId("data-destination-out-social-media-engagement-sheets"),
  enabled: true,
  task: {
    mode: "run",
    configPath: "writer/keboola.wr-google-sheets/data-destination-out-social-media-engagement-sheets",
  },
  continueOnFailure: false,
}
