[
  {
    id:          "g3s2-oauth-facebookads",
    name:        "Google oAuth",
    description: "Authorization for Facebook Ads",
    type:        "object",
    kind:        "oauth",
    default:      {},
    componentId: "keboola.ex-facebook-ads",
  },
  {
    id: "ex-facebook-ads-api-version",
    name: "Api version",
    description: "Set Facebook Api version",
    type: "string",
    kind: "input",
    default: "v12.0",
    rules: "required",
  },
]
