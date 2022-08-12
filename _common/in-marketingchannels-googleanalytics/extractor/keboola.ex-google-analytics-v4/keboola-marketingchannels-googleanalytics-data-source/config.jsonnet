{
  authorization: {
    oauth_api: Input("oauth-googleanalytics"),
  },
  parameters: Input("oauth-googleanalytics-profiles") + {
    outputBucket: "in.c-keboola-ex-google-analytics-"+ConfigId("keboola-marketingchannels-googleanalytics-data-source"),
  },
}
