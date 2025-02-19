{
  parameters: {
    outputBucket: "in.c-kds-team-ex-google-analytics-" + ConfigId("in-googleanalytics-extractor"),
    properties: Input("oauth-google-analytics-accounts")
  },
  authorization: {
    oauth_api: Input("oauth-google-analytics")
  },
}