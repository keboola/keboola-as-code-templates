{
  parameters: {
    outputBucket: "in.c-keboola-ex-google-analytics-v4-" + ConfigId("in-marketingchannels-googleanalytics4-data-source"),
    properties: Input("oauth-google-analytics-accounts")
  },
  authorization: {
    oauth_api: Input("oauth-google-analytics")
  },
}

