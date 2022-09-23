{
  name: "keboola.wr-snowflake-blob-storage-" + ConfigId("data-destination-out-mailchimp-snowflake"),
  task: {
    mode: "run",
    configPath: "<common>/out-mailchimp-snowflake/writer/keboola.wr-snowflake/data-destination-out-mailchimp-snowflake",
  },
  continueOnFailure: false,
  enabled: true,
}
