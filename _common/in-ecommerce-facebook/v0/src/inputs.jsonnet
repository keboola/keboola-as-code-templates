[
  {
    id:          "oauth-facebookads",
    name:        "Google oAuth",
    description: "Authorization for Facebook Ads",
    type:        "object",
    kind:        "oauth",
    componentId: "keboola.ex-facebook-ads",
    rules:       "required",
  },
  {
    id:           "oauth-facebookads-accounts",
    name:         "Facebook Ads Accounts",
    description:  "Accounts for Facebook Ads",
    type:         "object",
    kind:         "oauthAccounts",
    oauthInputId: "oauth-facebookads",
    rules:        "required",
  },
  {
    id: "ex-facebook-ads-api-version",
    name: "Facebook Api Version",
    description: "Set Facebook Api version",
    type: "string",
    kind: "input",
    default: "v12.0",
    rules: "required",
  }
]
