{
  name: "keboola.ex-facebook-ads-" + ConfigId("keboola-marketingchannels-facebook-data-source"),
  task: {
    mode: "run",
    configPath: "<common>/in-marketingchannels-facebookads/extractor/keboola.ex-facebook-ads/keboola-marketingchannels-facebook-data-source",
  },
  continueOnFailure: false,
  enabled: true,
}
