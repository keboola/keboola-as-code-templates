{
  parameters: {
    outputTable: "raw_landing_page_statistics",
    query: {
      dimensions: [
        {
          name: "date",
        },
        {
          name: "hostName",
        },
        {
          name: "pagePath",
        },
        {
          name: "landingPage",
        },
        {
          name: "landingpagePlusQueryString",
        },
        {
          name: "pageTitle",
        },
        {
          name: "country",
        },
        {
          name: "deviceCategory",
        },
        {
          name: "language",
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
          name: "totalUsers",
        },
        {
          name: "conversions",
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
          name: "eventCount",
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
