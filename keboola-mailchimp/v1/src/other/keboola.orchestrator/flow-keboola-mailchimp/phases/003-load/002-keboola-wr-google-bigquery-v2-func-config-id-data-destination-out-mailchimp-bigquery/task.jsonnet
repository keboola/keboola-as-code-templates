{
  name: "keboola.wr-google-bigquery-v2-" + ConfigId("data-destination-out-mailchimp-bigquery"),
  task: {
    mode: "run",
    configPath: "<common>/out-mailchimp-bigquery/writer/keboola.wr-google-bigquery-v2/data-destination-out-mailchimp-bigquery",
  },
  continueOnFailure: false,
  enabled: true,
}
