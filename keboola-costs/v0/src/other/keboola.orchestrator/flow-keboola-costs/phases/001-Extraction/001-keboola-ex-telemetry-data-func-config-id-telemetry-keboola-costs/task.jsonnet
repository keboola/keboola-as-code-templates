{
  name: "keboola.ex-telemetry-data-" + ConfigId("telemetry-keboola-costs"),
  task: {
    mode: "run",
    configPath: "<common>/in-keboola-costs/extractor/keboola.ex-telemetry-data/telemetry-keboola-costs",
  },
  continueOnFailure: false,
  enabled: true,
}
