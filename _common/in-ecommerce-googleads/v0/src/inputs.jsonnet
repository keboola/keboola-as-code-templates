[
  {
    id:          "g3s2-oauth-googleads",
    name:        "Google oAuth",
    description: "Authorization for Google Ads",
    type:        "object",
    kind:        "oauth",
    deafult:      {},
    componentId: "keboola.ex-google-ads",
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
