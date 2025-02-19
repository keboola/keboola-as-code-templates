{
  parameters: {
    outputTable: "raw_traffic_acquisition",
    query: {
      dimensions: [
        {
          name: "date",
        },
        {
          name: "sessionCampaignName",
        },
        {
          name: "sessionMedium",
        },
        {
          name: "sessionSource",
        },
        {
          name: "newVsReturning",
        },
        {
          name: "sessionDefaultChannelGrouping",
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
