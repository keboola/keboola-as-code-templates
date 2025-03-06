{
  name: "keboola.google-bigquery-transformation-" + ConfigId("transformation-in-mailchimp"),
  task: {
    mode: "run",
    configPath: "<common>/in-mailchimp/transformation/keboola.google-bigquery-transformation/transformation-in-mailchimp",
  },
  continueOnFailure: false,
  enabled: true,
}
