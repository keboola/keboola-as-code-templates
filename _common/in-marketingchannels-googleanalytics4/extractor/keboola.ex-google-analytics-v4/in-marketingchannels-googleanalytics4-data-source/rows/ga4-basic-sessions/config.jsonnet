{
  parameters: {
    outputTable: "ga4_basic_sessions",
    query: {
      dimensions: [
        {
          name: "date",
        },
        {
          name: "sessionSource",
        },
        {
          name: "sessionMedium",
        },
        {
          name: "sessionCampaignName",
        },
        {
          name: "newVsReturning",
        },
        {
          name: "sessionGoogleAdsKeyword",
        },
        {
          name: "hostName",
        },
        {
          name: "sessionGoogleAdsAdGroupName",
        },
      ],
      metrics: [
        {
          name: "sessions",
        },
        {
          name: "screenPageViews",
        },
        {
          name: "engagedSessions",
        },
      ],
      dateRanges: [
        {
          startDate: Input("ga4-from"),
          endDate: Input("ga4-to"),
        },
      ],
    },
    endpoint: "data-api",
  },
}
