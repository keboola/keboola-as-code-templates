{
  name: "keboola.google-bigquery-transformation-" + ConfigId("social-media-engagement"),
  enabled: true,
  task: {
    mode: "run",
    configPath: "transformation/keboola.google-bigquery-transformation/social-media-engagement",
  },
  continueOnFailure: false,
}
