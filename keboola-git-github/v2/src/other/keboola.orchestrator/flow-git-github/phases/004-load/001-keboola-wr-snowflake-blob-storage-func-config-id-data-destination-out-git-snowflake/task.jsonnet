{
  name: "keboola.wr-snowflake-" + ConfigId("data-destination-out-git-snowflake"),
  task: {
    mode: "run",
    configPath: "<common>/out-git-snowflake/writer/keboola.wr-snowflake/data-destination-out-git-snowflake",
  },
  continueOnFailure: false,
  enabled: true,
}
