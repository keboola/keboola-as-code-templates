if std.member(Input("select-writer"), "google-sheet") then
{
  name: "keboola.orchestrator-" + ConfigId("in-ecommerce-shoptet-extractor-6031003"),
  task: {
    mode: "run",
    configPath: "other/keboola.orchestrator/out-ecommerce-gsheet-orchestration-bdm-usage-6031003",
  },
  continueOnFailure: false,
  enabled: true,
}
else if std.member(Input("select-writer"), "snowflake-db") then
{
  name: "keboola.orchestrator-" + ConfigId("in-ecommerce-shoptet-extractor-6031003"),
  task: {
    mode: "run",
    configPath: "other/keboola.orchestrator/out-ecommerce-snowflake-orchestration-bdm-usage-6031003",
  },
  continueOnFailure: false,
  enabled: true,
}

