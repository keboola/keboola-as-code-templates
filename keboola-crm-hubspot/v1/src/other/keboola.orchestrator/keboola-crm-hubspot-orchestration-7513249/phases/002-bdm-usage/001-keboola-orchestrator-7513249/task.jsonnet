if Input("google-sheet-checkbox") == true then
{
  name: "keboola.orchestrator-" + ConfigId("in-crm-hubspot-extractor-7513249"),
  task: {
    mode: "run",
    configPath: "other/keboola.orchestrator/out-crm-gsheet-orchestration-bdm-usage-7513249",
  },
  continueOnFailure: false,
  enabled: true,
}
else if std.length(Input("wr-snowflake-blob-storage-db-host")) > 0 then
{
  name: "keboola.orchestrator-" + ConfigId("in-crm-hubspot-extractor-7513249"),
  task: {
    mode: "run",
    configPath: "other/keboola.orchestrator/out-crm-snowflake-orchestration-bdm-usage-7513249",
  },
  continueOnFailure: false,
  enabled: true,
}

