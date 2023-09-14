{
  authorization: {
    oauth_api: Input("oauth-googleads"),
  },
  parameters: {
    customerId: Input("oauth-googleads-accounts"),
    onlyEnabledCustomers: true,
  },
}
