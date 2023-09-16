{
  name: "keboola.data-apps-" + ConfigId("data-app-ai-campaign-executer"),
  enabled: true,
  task: {
    mode: "run",
    configPath: "app/keboola.data-apps/data-app-ai-campaign-executer",
  },
  continueOnFailure: false,
}
