[
  {
    id:          "oauth-googleanalytics",
    name:        "Open Authentication",
    description: "Authorization for Google Analytics",
    type:        "object",
    kind:        "oauth",
    default:      {},
    componentId: "keboola.ex-google-analytics-v4",
  },
  {
    id:           "oauth-googleanalytics-profiles",
    name:         "Google Analytics Profiles",
    description:  "Profiles or Properties for Google Analytics",
    type:         "object",
    kind:         "oauthAccounts",
    oauthInputId: "oauth-googleanalytics",
    rules:        "required",
  },
  {
    id: "ga-from",
    name: "Period from date",
    description: "From when do you want to get the data?",
    type: "string",
    kind: "select",
    rules: "required",
    default: "-3 months",
    options: [
      {
        value: '-1 week',
        label: '1 week ago',
      },
      {
        value: '-1 month',
        label: '1 month ago',
      },
      {
        value: '-3 months',
        label: '3 months ago',
      },
      {
        value: '-6 months',
        label: '6 months ago',
      },
    ],
  },
  {
    id: "ga-to",
    name: "Period to date",
    description: "To when do you want to get the data?",
    type: "string",
    kind: "select",
    default: "-1 day",
    options: [
      {
        value: '-1 day',
        label: '1 day ago',
      },
      {
        value: '-1 week',
        label: '1 week ago',
      },
    ],
  }
]
