{
  parameters: {
    outputTable: "raw_audience",
    query: {
      dimensions: [
        {
          name: "date",
        },
        {
          name: "audienceId",
        },
        {
          name: "audienceName",
        },
      ],
      metrics: [
        {
          name: "activeUsers",
        },
        {
          name: "newUsers",
        },
        {
          name: "sessions",
        },
        {
          name: "screenPageViews",
        },
        {
          name: "userEngagementDuration",
        },
        {
          name: "totalUsers",
        },
        {
          name: "engagedSessions",
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
