[
  {
    id: "ex-bingads-dev-key",
    name: "Developer Token",
    description: "Your developer token of your BingAds account.",
    type: "string",
    kind: "hidden",
    rules: "required",
  },
  {
    id: "ex-bingads-account-id",
    name: "Account ID",
    description: "Account identifier of your BingAds account.",
    type: "string",
    kind: "input",
    default: "XXXXXXXX",
  },
  {
    id: "ex-bingads-customer-id",
    name: "Customer ID",
    description: "Customer identifier of your BingAds account.",
    type: "string",
    kind: "input",
    default: "XXXXXXXX",
  },
  {
    id:          "g3s2-oauth-bingads",
    name:        "Google oAuth",
    description: "Authorization for Bing Ads",
    type:        "object",
    kind:        "oauth",
    default:      {},
    componentId: "esnerda.ex-bingads",
  }
]
