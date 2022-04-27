if Input("google-sheet-checkbox") == true then
{
  name: "keboola.orchestrator-" + ConfigId("in-ecommerce-shoptet-extractor-6031003"),
  task: {
    mode: "run",
    configPath: "other/keboola.orchestrator/out-ecommerce-gsheet-orchestration-bdm-usage-6031003",
  },
  continueOnFailure: false,
  enabled: true,
}
else if std.length(Input("wr-snowflake-blob-storage-db-host")) > 0 then
{
  name: "keboola.orchestrator-" + ConfigId("in-ecommerce-shoptet-extractor-6031003"),
  task: {
    mode: "run",
    configPath: "other/keboola.orchestrator/out-ecommerce-snowflake-orchestration-bdm-usage-6031003",
  },
  continueOnFailure: false,
  enabled: true,
}

