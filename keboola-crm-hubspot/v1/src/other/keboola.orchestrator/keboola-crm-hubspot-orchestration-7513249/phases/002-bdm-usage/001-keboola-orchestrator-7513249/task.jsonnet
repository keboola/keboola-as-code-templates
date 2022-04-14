if std.member(Input("select-writer"), "google-sheet") then
{
  name: "keboola.orchestrator-" + ConfigId("in-crm-hubspot-extractor-7513249"),
  task: {
    mode: "run",
    configPath: "other/keboola.orchestrator/out-crm-gsheet-orchestration-bdm-usage-7513249",
  },
  continueOnFailure: false,
  enabled: true,
}
else if std.member(Input("select-writer"), "snowflake-db") then
{
  name: "keboola.orchestrator-" + ConfigId("in-crm-hubspot-extractor-7513249"),
  task: {
    mode: "run",
    configPath: "other/keboola.orchestrator/out-crm-snowflake-orchestration-bdm-usage-7513249",
  },
  continueOnFailure: false,
  enabled: true,
}

