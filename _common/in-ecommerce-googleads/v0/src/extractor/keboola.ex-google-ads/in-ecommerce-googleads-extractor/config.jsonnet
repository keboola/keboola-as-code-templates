{
  authorization: {
    oauth_api: Input("oauth-googleads"),
  },
  parameters: Input("oauth-googleads-accounts") + {
    customerId: Input("ex-google-ads-customer-id"),
  },
}
