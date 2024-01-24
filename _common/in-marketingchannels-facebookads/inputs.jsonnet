[
  {
    id:          "oauth-facebookads",
    name:        "Open Authentication",
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
    id: "ex-facebook-ads-since",
    name: "Period from date [incl.]",
    description: "Select period from which you want to get the data.",
    type: "string",
    kind: "select",
    default: 'last_90d',
    options: [
      {
        value: 'last_month',
        label: '1 month ago',
      },
      {
        value: 'last_60d',
        label: '2 months ago',
      },
      {
        value: 'last_90d',
        label: '3 months ago',
      },
      {
        value: 'last_year',
        label: '6 months ago',
      },
    ],
  },
]
