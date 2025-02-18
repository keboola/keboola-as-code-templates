{
  name: "keboola.google-bigquery-transformation-" + ConfigId("transformation-in-mailchimp-bq"),
  task: {
    mode: "run",
    configPath: "<common>/in-mailchimp/transformation/keboola.google-bigquery-transformation/transformation-in-mailchimp-bq",
  },
  continueOnFailure: false,
  enabled: true,
}
