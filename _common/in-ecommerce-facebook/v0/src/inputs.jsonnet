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
    id: "ex-facebook-ads-since",
    name: "Period from date [incl.]",
    description: "Select period from which you want to get the data.",
    type: "string",
    kind: "select",
    default: '6 months ago',
    options: [
      {
        value: '1 month ago',
        label: '1 month ago',
      },
      {
        value: '2 months ago',
        label: '2 months ago',
      },
      {
        value: '3 months ago',
        label: '3 months ago',
      },
      {
        value: '6 months ago',
        label: '6 months ago',
      },
    ],
  },
  {
    id: "ex-facebook-ads-until",
    name: "Period to date [excl.]",
    description: "Select period to date you want to get the data.",
    type: "string",
    kind: "select",
    default: '1 day ago',
    options: [
      {
        value: '1 day ago',
        label: '1 day ago',
      },
      {
        value: '7 days ago',
        label: '7 days ago',
      },
    ],
  },
]
