{
  name: "keboola.google-bigquery-transformation-" + ConfigId("twilio-sms-data-preparation"),
  enabled: true,
  task: {
    mode: "run",
    configPath: "transformation/keboola.google-bigquery-transformation/twilio-sms-data-preparation",
  },
  continueOnFailure: false,
}
