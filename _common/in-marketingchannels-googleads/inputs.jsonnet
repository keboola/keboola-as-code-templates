[
  {
    id:          "g3s2-oauth-googleads",
    name:        "Google oAuth",
    description: "Authorization for Google Ads",
    type:        "object",
    kind:        "oauth",
    default:      {},
    componentId: "keboola.ex-google-ads",
  },
  {
    id: "ex-google-ads-customer-id",
    name: "Ads Customer Id",
    description: "Insert ads customer ID",
    type: "string",
    kind: "input",
    default: "XXX-XXX-XXXX",
    rules: "required",
  },
  {
    id: "ex-google-ads-since",
    name: "Since",
    description: "",
    type: "string",
    kind: "select",
    default: "-6 months",
    options: [
      {
        value: "-1 week",
        label: "last week"
      },
      {
        value: "-1 month",
        label: "last month"
      },
      {
        value: "-3 months",
        label: "last 3 months"
      },
      {
        value: "-6 months",
        label: "last 6 months"
      },
    ],
  },
  {
    id: "ex-google-ads-until",
    name: "Until",
    description: "",
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