if std.member(Input("select-writer"), "big-query") then
{
  name: "keboola.orchestrator-" + ConfigId("in-thoughtspot-hubspot-extractor-10708760"),
  task: {
    mode: "run",
    configPath: "other/keboola.orchestrator/out-thoughtspot-hubspot-bigquery-orchestration-bdm-usage-10708760",
  },
  continueOnFailure: false,
  enabled: true,
}
else if std.member(Input("select-writer"), "snowflake-db") then
{
  name: "keboola.orchestrator-" + ConfigId("in-thoughtspot-hubspot-extractor-10708760"),
  task: {
    mode: "run",
    configPath: "other/keboola.orchestrator/out-thoughtspot-hubspot-snowflake-orchestration-bdm-usage-10708760",
  },
  continueOnFailure: false,
  enabled: true,
}

