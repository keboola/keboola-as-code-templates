{
  name: "keboola.wr-db-pgsql-" + ConfigId("data-destination-out-googleanalytics4-postgresql"),
  enabled: true,
  task: {
    mode: "run",
    configPath: "<common>/out-googleanalytics4-postgresql/src/writer/keboola.wr-db-pgsql/data-destination-out-googleanalytics4-postgresql",
  },
  continueOnFailure: false,
}
