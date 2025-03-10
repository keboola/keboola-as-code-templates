{
  name: "keboola.data-apps-" + ConfigId("my-data-app"),
  enabled: true,
  task: {
    mode: "run",
    configPath: "app/keboola.data-apps/my-data-app",
  },
  continueOnFailure: false,
}
