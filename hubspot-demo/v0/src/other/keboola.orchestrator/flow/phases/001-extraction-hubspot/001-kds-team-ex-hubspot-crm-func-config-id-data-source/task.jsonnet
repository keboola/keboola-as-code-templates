{
  name: "kds-team.ex-hubspot-crm-" + ConfigId("data-source"),
  enabled: true,
  continueOnFailure: false,
  task: {
    mode: "run",
    configPath: "extractor/kds-team.ex-hubspot-crm/data-source",
  },
}
