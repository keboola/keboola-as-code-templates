{
  name: "apify.apify-" + ConfigId("google-reviews"),
  enabled: true,
  task: {
    mode: "run",
    configPath: "extractor/apify.apify/google-reviews",
  },
  continueOnFailure: false,
}
