{
  parameters: {
    outputBucket: "in.c-keboola-ex-google-analytics-v4-" + ConfigId("in-googleanalytics4-extractor"),
    properties: Input("oauth-google-analytics-accounts")
  },
  authorization: {
    oauth_api: Input("oauth-google-analytics")
  },
}
