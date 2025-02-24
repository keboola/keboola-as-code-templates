{
  name: "keboola.ex-db-snowflake-" + ConfigId("snowflake-security-data-source"),
  enabled: true,
  task: {
    mode: "run",
    configPath: "extractor/keboola.ex-db-snowflake/snowflake-security-data-source",
  },
  continueOnFailure: false,
}
