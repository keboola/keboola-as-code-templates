{
  name: "keboola.data-apps-" + ConfigId("data-app-kai-sql-bot"),
  enabled: true,
  task: {
    mode: "run",
    configPath: "app/keboola.data-apps/data-app-kai-sql-bot",
  },
  continueOnFailure: false,
}
