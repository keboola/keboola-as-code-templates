{
  parameters: {
    outputTable: "raw_demographic",
    query: {
      dimensions: [
        {
          name: "date",
        },
        {
          name: "userAgeBracket",
        },
        {
          name: "userGender",
        },
        {
          name: "language",
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
