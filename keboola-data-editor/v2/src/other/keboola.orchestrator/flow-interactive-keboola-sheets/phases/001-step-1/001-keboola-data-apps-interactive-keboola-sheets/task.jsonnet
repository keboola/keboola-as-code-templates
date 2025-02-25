{
  name: "keboola.data-apps-" + ConfigId("data-app-interactive-keboola-sheets"),
  enabled: true,
  task: {
    mode: "run",
    configPath: "app/keboola.data-apps/data-app-interactive-keboola-sheets",
  },
  continueOnFailure: false,
}
