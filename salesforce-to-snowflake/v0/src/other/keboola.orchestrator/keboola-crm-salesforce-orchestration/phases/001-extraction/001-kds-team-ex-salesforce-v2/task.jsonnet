{
  name: "kds-team.ex-salesforce-v2-" + ConfigId("in-crm-salesforce-extractor"),
  task: {
    mode: "run",
    configPath: "<common>/in-crm-salesforce/v0/src/extractor/kds-team.ex-salesforce-v2/in-crm-salesforce-extractor",
  },
  continueOnFailure: false,
  enabled: true,
}
