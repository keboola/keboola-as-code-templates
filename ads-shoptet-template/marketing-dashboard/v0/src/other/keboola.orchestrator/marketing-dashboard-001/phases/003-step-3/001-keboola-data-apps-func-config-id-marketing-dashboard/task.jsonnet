{
  name: "keboola.data-apps-" + ConfigId("marketing-dashboard"),
  enabled: true,
  task: {
    mode: "run",
    configPath: "app/keboola.data-apps/marketing-dashboard",
  },
  continueOnFailure: false,
}
