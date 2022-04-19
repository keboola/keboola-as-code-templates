if std.member(Input("select-writer"), "google-sheet") then
{
  name: "keboola.orchestrator-" + ConfigId("in-crm-salesforce-extractor-12706099"),
  task: {
    mode: "run",
    configPath: "other/keboola.orchestrator/out-crm-gsheet-orchestration-bdm-usage-12706099",
  },
  continueOnFailure: false,
  enabled: true,
}
else if std.member(Input("select-writer"), "snowflake-db") then
{
  name: "keboola.orchestrator-" + ConfigId("in-crm-salesforce-extractor-12706099"),
  task: {
    mode: "run",
    configPath: "other/keboola.orchestrator/out-crm-snowflake-orchestration-bdm-usage-12706099",
  },
  continueOnFailure: false,
  enabled: true,
}

