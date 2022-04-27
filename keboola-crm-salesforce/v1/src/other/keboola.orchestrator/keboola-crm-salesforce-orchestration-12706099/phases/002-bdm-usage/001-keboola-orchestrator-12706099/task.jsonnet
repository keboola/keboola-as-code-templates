if Input("google-sheet-checkbox") == true then
{
  name: "keboola.orchestrator-" + ConfigId("in-crm-salesforce-extractor-12706099"),
  task: {
    mode: "run",
    configPath: "other/keboola.orchestrator/out-crm-gsheet-orchestration-bdm-usage-12706099",
  },
  continueOnFailure: false,
  enabled: true,
}
else if std.length(Input("wr-snowflake-blob-storage-db-host")) > 0 then
{
  name: "keboola.orchestrator-" + ConfigId("in-crm-salesforce-extractor-12706099"),
  task: {
    mode: "run",
    configPath: "other/keboola.orchestrator/out-crm-snowflake-orchestration-bdm-usage-12706099",
  },
  continueOnFailure: false,
  enabled: true,
}

