{
  name: "keboola.wr-snowflake-blob-storage-" + if std.length("ex-hubspot-crm-api-token") > 0 then ConfigId("in-crm-hubspot-extractor-7513249") else if std.length("ex-salesforce-v2-username") > 0 then ConfigId("in-crm-salesforce-extractor-12706099"),
  task: {
    mode: "run",
    configPath: "writer/keboola.wr-snowflake-blob-storage/out-crm-snowflake-writer-12706099",
  },
  continueOnFailure: false,
  enabled: true,
}
