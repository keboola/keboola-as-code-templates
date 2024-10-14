{
  name: "keboola.wr-db-pgsql-" + ConfigId("data-destination-out-social-media-engagement-postgresql"),
  enabled: true,
  task: {
    mode: "run",
    configPath: "writer/keboola.wr-db-pgsql/data-destination-out-social-media-engagement-postgresql",
  },
  continueOnFailure: false,
}
