[
  {
    id:          "oauth-googleads",
    name:        "Google oAuth",
    description: "Authorization for Google Ads",
    type:        "object",
    kind:        "oauth",
    componentId: "keboola.ex-google-ads",
    rules:       "required",
  },
  {
    id:           "oauth-googleads-accounts",
    name:         "Google Ads Accounts",
    description:  "Accounts for Google Ads",
    type:         "object",
    kind:         "oauthAccounts",
    oauthInputId: "oauth-googleads",
    rules:        "required",
  },
  {
    id: "ex-google-ads-customer-id",
    name: "Ads customer ID",
    description: "Insert ads customer ID",
    type: "string",
    kind: "input",
    default: "XXX-XXX-XXXX",
    rules: "required",
  }
]
