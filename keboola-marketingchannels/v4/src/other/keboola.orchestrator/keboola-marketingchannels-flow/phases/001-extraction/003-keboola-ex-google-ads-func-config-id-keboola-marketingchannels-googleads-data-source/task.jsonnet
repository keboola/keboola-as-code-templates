{
  name: "keboola.ex-google-ads-" + ConfigId("keboola-marketingchannels-googleads-data-source"),
  task: {
    mode: "run",
    configPath: "<common>/in-marketingchannels-googleads/extractor/keboola.ex-google-ads/keboola-marketingchannels-googleads-data-source",
  },
  continueOnFailure: false,
  enabled: true,
}
