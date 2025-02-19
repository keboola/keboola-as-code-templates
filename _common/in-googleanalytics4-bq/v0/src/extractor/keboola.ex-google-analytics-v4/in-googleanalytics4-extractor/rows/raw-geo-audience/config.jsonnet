{
  parameters: {
    outputTable: "raw_geo_audience",
    query: {
      dimensions: [
        {
          name: "date",
        },
        {
          name: "city",
        },
        {
          name: "country",
        },
        {
          name: "region",
        },
        {
          name: "sessionDefaultChannelGrouping",
        },
        {
          name: "newVsReturning",
        },
      ],
      metrics: [
        {
          name: "conversions",
        },
        {
          name: "engagedSessions",
        },
        {
          name: "eventCount",
        },
        {
          name: "sessions",
        },
        {
          name: "screenPageViews",
        },
        {
          name: "activeUsers",
        },
        {
          name: "newUsers",
        },
        {
          name: "userEngagementDuration",
        },
        {
          name: "totalUsers",
        },
        {
          name: "averageSessionDuration",
        },
      ],
      dateRanges: [
        {
          startDate: Input("ga-from"),
          endDate: Input("ga-to"),
        },
      ],
    },
    endpoint: "data-api",
  },
}
