{
  authorization: {
    oauth_api: Input("oauth-googleanalytics"),
  },
  parameters: Input("oauth-googleanalytics-profiles") + {
    outputBucket: "in.c-keboola-ex-google-analytics-"+ConfigId("keboola-marketingchannels-googleanalytics-data-source"),
    queries: [
      {
        enabled: true,
        endpoint: "reports",
        id: 87215,
        name: "BasicSessions",
        outputTable: "ga-basic-sessions",
        query: {
          dateRanges: [
            {
              endDate: Input("ga-to"),
              startDate: Input("ga-from"),
            },
          ],
          dimensions: [
            {
          name: "ga:date",
        },
        {
          name: "ga:source",
        },
        {
          name: "ga:medium",
        },
        {
          name: "ga:campaign",
        },
        {
          name: "ga:userType",
        },
        {
          name: "ga:keyword",
        },
        {
          name: "ga:hostname",
        },
        {
          name: "ga:adGroup",
        },
          ],
          metrics: [
            {
          expression: "ga:sessions",
        },
        {
          expression: "ga:pageviews",
        },
        {
          expression: "ga:bounces",
        },
          ],
        },
      },
      {
        enabled: true,
        endpoint: "reports",
        id: 66354,
        name: "BasicTransactions",
        outputTable: "ga-basic-transactions",
        query: {
          dateRanges: [
            {
              endDate: Input("ga-to"),
              startDate: Input("ga-from"),
            },
          ],
          dimensions: [
            {
          name: "ga:date",
        },
        {
          name: "ga:source",
        },
        {
          name: "ga:medium",
        },
        {
          name: "ga:campaign",
        },
        {
          name: "ga:userType",
        },
        {
          name: "ga:keyword",
        },
        {
          name: "ga:hostname",
        },
        {
          name: "ga:adGroup",
        },
        {
          name: "ga:transactionId",
        },
          ],
          metrics: [
            {
          expression: "ga:itemQuantity",
        },
          ],
        },
      },
    ]
  }
}
