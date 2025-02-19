{
  parameters: {
    skipGenerateSystemTables: true,
    outputTable: "raw_geo_audience",
    query: {
          dimensions: [
            {
              name: "ga:date",
            },
            {
              name: "ga:country",
            },
            {
              name: "ga:region",
            },
            {
              name: "ga:latitude",
            },
            {
              name: "ga:longitude",
            },
            {
              name: "ga:channelGrouping",
            },
            {
              name: "ga:userType",
            },
            {
              name: "ga:source",
            },
            {
              name: "ga:medium",
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