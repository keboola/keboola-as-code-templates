{
  name: "kds-team.app-datahub-" + ConfigId("data-destination-out-datahub"),
  enabled: true,
  task: {
    mode: "run",
    configPath: "application/kds-team.app-datahub/data-destination-out-datahub",
  },
  continueOnFailure: false,
}
