{
  name: "keboola.data-apps-" + ConfigId("my-data-app"),
  enabled: true,
  continueOnFailure: false,
  task: {
    mode: "run",
    configPath: "app/keboola.data-apps/my-data-app",
  },
}
