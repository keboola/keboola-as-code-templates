{
  name: "kds-team.ex-hubspot-crm-" + ConfigId("in-crm-hubspot-extractor"),
  task: {
    mode: "run",
    configPath: "<common>/in-crm-hubspot/v0/src/extractor/kds-team.ex-hubspot-crm/in-crm-hubspot-extractor",
  },
  continueOnFailure: false,
  enabled: true,
}
