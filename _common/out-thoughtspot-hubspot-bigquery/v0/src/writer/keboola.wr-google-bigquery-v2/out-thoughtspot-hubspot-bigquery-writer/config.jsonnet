{
  parameters: {
    service_account: {
      "#private_key": Input("wr-google-bigquery-v2-service-account-private-key"),
      project_id: Input("wr-google-bigquery-v2-service-account-project-id"),
      token_uri: "https://oauth2.googleapis.com/token",
      client_email: Input("wr-google-bigquery-v2-service-account-client-email"),
      client_id: Input("wr-google-bigquery-v2-service-account-client-id"),
      auth_uri: "https://accounts.google.com/o/oauth2/auth",
      auth_provider_x509_cert_url: "https://www.googleapis.com/oauth2/v1/certs",
      private_key_id: Input("wr-google-bigquery-v2-service-account-private-key-id"),
      client_x509_cert_url: "https://www.googleapis.com/robot/v1/metadata/x509/templates%40keboola-shopify.iam.gserviceaccount.com",
      type: "service_account",
    },
    dataset: "keboola-husbpot",
  },
}
