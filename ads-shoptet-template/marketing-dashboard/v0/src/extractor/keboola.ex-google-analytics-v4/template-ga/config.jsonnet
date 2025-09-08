{
  authorization: {
    oauth_api: Input("oauth-googleanalytics4"),
  },
  parameters: Input("oauth-googleanalytics-profiles4") + {
    outputBucket: "in.c-GoogleAnalytics-" + ConfigId("template-ga"),
  },
}
