{
  name: "keboola.wr-google-sheets-" + if std.length("ex-hubspot-crm-api-token") > 0 then ConfigId("in-crm-hubspot-extractor-7513249") else if std.length("ex-salesforce-v2-username") > 0 then ConfigId("in-crm-salesforce-extractor-12706099"),
  task: {
    mode: "run",
    configPath: "writer/keboola.wr-google-sheets/out-crm-gsheet-writer-7513249",
  },
  continueOnFailure: false,
  enabled: true,
}
