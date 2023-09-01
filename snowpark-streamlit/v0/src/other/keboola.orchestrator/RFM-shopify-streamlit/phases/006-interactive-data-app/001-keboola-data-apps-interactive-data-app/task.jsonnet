{
  name: "keboola.data-apps-" + ConfigId("interactive-data-app"),
  enabled: true,
  continueOnFailure: false,
  task: {
    mode: "run",
    configPath: "app/keboola.data-apps/interactive-data-app",
  },
}
