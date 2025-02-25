{
  name: "keboola.wr-snowflake-blob-storage-" + ConfigId("data-destination-out-social-media-engagement-snowflake"),
  enabled: true,
  task: {
    mode: "run",
    configPath: "writer/keboola.wr-snowflake-blob-storage/data-destination-out-social-media-engagement-snowflake",
  },
  continueOnFailure: false,
}
