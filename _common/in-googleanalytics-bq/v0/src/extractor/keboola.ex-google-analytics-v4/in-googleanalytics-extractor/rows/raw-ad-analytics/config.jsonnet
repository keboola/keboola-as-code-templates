{
  parameters: {
    skipGenerateSystemTables: true,
    outputTable: "raw_ad_analytics",
    query: {
          dimensions: [
            {
              name: "ga:date",
            },
            {
              name: "ga:adGroup",
            },
            {
              name: "ga:adContent",
            },
            {
              name: "ga:adDistributionNetwork",
            },
            {
              name: "ga:campaign",
            },
            {
              name: "ga:adSlot",
            },
          ],
          metrics: [
            {
              expression: "ga:impressions",
            },
            {
              expression: "ga:adClicks",
            },
            {
              expression: "ga:adCost",
            },
            {
              expression: "ga:CPM",
            },
            {
              expression: "ga:CPC",
            },
            {
              expression: "ga:transactionRevenue",
            },
            {
              expression: "ga:sessions",
            },
            {
              expression: "ga:bounces",
            },
            {
              expression: "ga:users",
            },
            {
              expression: "ga:pageviews",
            },
          ],
        dateRanges: [
            {
              endDate: Input("ga-to"),
              startDate: Input("ga-from"),
            },
        ]
      },
      endpoint: "reports",
  }
}