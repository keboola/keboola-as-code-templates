{
  parameters: {
    outputBucket: "in.c-keboola-ex-google-analytics-v4-" + ConfigId("in-googleanalytics4-extractor"),
    Input("oauth-google-analytics-accounts")
  },
  authorization: {
    oauth_api: Input("oauth-google-analytics")
  },
}
