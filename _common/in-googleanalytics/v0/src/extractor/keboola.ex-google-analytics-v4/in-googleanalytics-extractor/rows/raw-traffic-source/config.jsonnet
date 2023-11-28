{
  parameters: {
    skipGenerateSystemTables: true,
    outputTable: "raw_traffic_source",
    query: {
          dimensions: [
            {
              name: "ga:userType",
            },
            {
              name: "ga:date",
            },
            {
              name: "ga:campaign",
            },
            {
              name: "ga:source",
            },
            {
              name: "ga:medium",
            },
            {
              name: "ga:keyword",
            },
            {
              name: "ga:adContent",
            },
            {
              name: "ga:socialNetwork",
            },
            {
              name: "ga:channelGrouping",
            },
          ],
          metrics: [
            {
              expression: "ga:sessions",
            },
            {
              expression: "ga:users",
            },
            {
              expression: "ga:bounces",
            },
            {
              expression: "ga:sessionDuration",
            },
            {
              expression: "ga:pageviews",
            },
            {
              expression: "ga:organicSearches",
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