{
  authorization: {
    oauth_api: Input("oauth-googleanalytics"),
  },
  parameters: Input("oauth-googleanalytics-profiles") + {
    outputBucket: "in.c-keboola-ex-google-analytics-v4-" + ConfigId("ua-data-ua-ga4-comparison-app"),
  },
}
