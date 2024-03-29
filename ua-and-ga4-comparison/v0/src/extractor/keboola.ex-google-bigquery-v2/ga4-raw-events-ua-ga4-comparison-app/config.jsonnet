{
  parameters: {
    service_account: {
      "#private_key": Input("ex-google-bigquery-v2-service-account-private-key"),
      project_id: Input("ex-google-bigquery-v2-service-account-project-id"),
      token_uri: "https://oauth2.googleapis.com/token",
      client_email: Input("ex-google-bigquery-v2-service-account-client-email"),
      client_id: Input("ex-google-bigquery-v2-service-account-client-id"),
      auth_uri: "https://accounts.google.com/o/oauth2/auth",
      auth_provider_x509_cert_url: "https://www.googleapis.com/oauth2/v1/certs",
      private_key_id: Input("ex-google-bigquery-v2-service-account-private-key-id"),
      client_x509_cert_url: "https://www.googleapis.com/robot/v1/metadata/x509/datalook-ga%40keboola-plg.iam.gserviceaccount.com",
      type: "service_account",
    },
    google: {
      storage: Input("ex-bq-google-storage"), 
      location: Input("ex-bq-location"), # EU
    },
  },
}