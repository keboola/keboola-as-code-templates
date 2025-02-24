{
  name: "keboola.ex-telemetry-data-" + ConfigId("telemetry-activity-center"),
  task: {
    mode: "run",
    configPath: "<common>/in-activity-center/extractor/keboola.ex-telemetry-data/telemetry-activity-center",
  },
  continueOnFailure: false,
  enabled: true,
}
