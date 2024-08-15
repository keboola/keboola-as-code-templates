{
  name: "keboola.data-apps-" + ConfigId("review-generator"),
  enabled: false,
  task: {
    mode: "run",
    configPath: "app/keboola.data-apps/review-generator",
  },
  continueOnFailure: false,
}
