{
  name: "keboola.wr-db-mysql-" + ConfigId("data-destination-out-social-media-engagement-mysql"),
  enabled: true,
  task: {
    mode: "run",
    configPath: "writer/keboola.wr-db-mysql/data-destination-out-social-media-engagement-mysql",
  },
  continueOnFailure: false,
}
