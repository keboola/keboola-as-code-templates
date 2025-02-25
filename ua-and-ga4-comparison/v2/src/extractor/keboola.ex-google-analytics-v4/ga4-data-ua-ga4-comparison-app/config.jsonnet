{
  authorization: {
    oauth_api: Input("oauth-googleanalytics4"),
  },
  parameters: Input("oauth-googleanalytics-profiles4") + {
    outputBucket: "in.c-keboola-ex-google-analytics-v4-" + ConfigId("ga4-data-ua-ga4-comparison-app"),
  },
}
