{
  parameters: {
    skipGenerateSystemTables: true,
    outputTable: "raw_demographic_audience",
    query: {
          dimensions: [
            {
              name: "ga:date",
            },
            {
              name: "ga:userAgeBracket",
            },
            {
              name: "ga:userGender",
            },
            {
              name: "ga:interestAffinityCategory",
            },
            {
              name: "ga:channelGrouping",
            },
            {
              name: "ga:userType",
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