{
  parameters: {
    api_path: Input("ex-bigcommerce-api-path"),
    "#access_token": Input("ex-bigcommerce-access-token"),
  },
  runtime: {
    process_timeout: 7200
  },
}
