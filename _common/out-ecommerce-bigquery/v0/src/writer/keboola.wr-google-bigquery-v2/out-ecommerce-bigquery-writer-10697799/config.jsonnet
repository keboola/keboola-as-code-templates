{
  parameters: {
    service_account: {
      "#private_key": Input("wr-google-bigquery-v2-service-account-private-key"),
      project_id: "keboola-shopify",
      token_uri: "https://oauth2.googleapis.com/token",
      client_email: "templates@keboola-shopify.iam.gserviceaccount.com",
      client_id: "106087736072000139026",
      auth_uri: "https://accounts.google.com/o/oauth2/auth",
      auth_provider_x509_cert_url: "https://www.googleapis.com/oauth2/v1/certs",
      private_key_id: "d2e2566f0e135400f270f32895760c9c8954d497",
      client_x509_cert_url: "https://www.googleapis.com/robot/v1/metadata/x509/templates%40keboola-shopify.iam.gserviceaccount.com",
      type: "service_account",
    },
    dataset: "thoughtspot",
  },
}
