{
  parameters: {
    outputBucket: "in.c-keboola-ex-google-analytics-"+ConfigId("keboola-marketingchannels-googleanalytics-data-source"),
  },
  authorization: {
    oauth_api: Input("g3s2-oauth-googleanalytics"),
  }
}
