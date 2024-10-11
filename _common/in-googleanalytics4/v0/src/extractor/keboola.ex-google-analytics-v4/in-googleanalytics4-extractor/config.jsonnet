{
  parameters: Input('oauth-google-analytics-accounts') + {
    outputBucket: 'in.c-keboola-ex-google-analytics-v4-' + ConfigId('in-googleanalytics4-extractor'),
  },
  authorization: {
    oauth_api: Input('oauth-google-analytics'),
  },
}
