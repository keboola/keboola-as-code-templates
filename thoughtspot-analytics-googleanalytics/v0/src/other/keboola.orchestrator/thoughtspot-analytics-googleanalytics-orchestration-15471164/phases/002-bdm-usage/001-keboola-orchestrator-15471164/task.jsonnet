if std.member(Input("select-writer"), "big-query") then
{
  name: "keboola.orchestrator-" + ConfigId("in-thoughtspot-gaa-extractor-15471164"),
  task: {
    mode: "run",
    configPath: "other/keboola.orchestrator/out-thoughtspot-gaa-bigquery-orchestration-bdm-usage-15471164",
  },
  continueOnFailure: false,
  enabled: true,
}
else if std.member(Input("select-writer"), "snowflake-db") then
{
  name: "keboola.orchestrator-" + ConfigId("in-thoughtspot-gaa-extractor-15471164"),
  task: {
    mode: "run",
    configPath: "other/keboola.orchestrator/out-thoughtspot-gaa-snowflake-orchestration-bdm-usage-15471164",
  },
  continueOnFailure: false,
  enabled: true,
}

