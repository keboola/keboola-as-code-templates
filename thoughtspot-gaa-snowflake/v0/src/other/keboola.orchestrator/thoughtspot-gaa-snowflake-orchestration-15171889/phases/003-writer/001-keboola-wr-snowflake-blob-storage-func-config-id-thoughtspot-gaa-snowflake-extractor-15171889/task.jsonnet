{
  name: "keboola.wr-snowflake-blob-storage-" + ConfigId("thoughtspot-gaa-snowflake-extractor-15171889"),
  continueOnFailure: false,
  enabled: true,
  task: {
    mode: "run",
    configPath: "writer/keboola.wr-snowflake-blob-storage/thoughtspot-gaa-snowflake-writer-15171889",
  },
}
