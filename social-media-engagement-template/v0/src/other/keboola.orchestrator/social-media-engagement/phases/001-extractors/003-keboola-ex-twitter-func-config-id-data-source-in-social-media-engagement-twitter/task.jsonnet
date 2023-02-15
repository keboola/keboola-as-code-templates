{
  name: "keboola.ex-twitter-" + ConfigId("data-source-in-social-media-engagement-twitter"),
  enabled: true,
  task: {
    mode: "run",
    configPath: "extractor/keboola.ex-twitter/data-source-in-social-media-engagement-twitter",
  },
  continueOnFailure: false,
}
