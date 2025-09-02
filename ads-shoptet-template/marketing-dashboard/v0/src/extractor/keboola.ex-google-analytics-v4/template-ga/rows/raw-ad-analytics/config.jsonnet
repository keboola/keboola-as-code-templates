{
  parameters: {
    outputTable: "raw_ad_analytics",
    query: {
      metrics: [
        {
          name: "advertiserAdClicks",
        },
        {
          name: "advertiserAdImpressions",
        },
        {
          name: "advertiserAdCost",
        },
        {
          name: "advertiserAdCostPerClick",
        },
        {
          name: "averagePurchaseRevenue",
        },
        {
          name: "engagedSessions",
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
          name: "conversions",
        },
      ],
      dimensions: [
        {
          name: "date",
        },
        {
          name: "sessionGoogleAdsAdGroupName",
        },
        {
          name: "sessionGoogleAdsAdNetworkType",
        },
        {
          name: "sessionGoogleAdsCampaignName",
        },
      ],
      dateRanges: [
        {
          startDate: Input("ex-google-analytics-v4-query-date-ranges-0-start-date"),
          endDate: Input("ex-google-analytics-v4-query-date-ranges-0-end-date"),
        },
      ],
    },
    endpoint: "data-api",
  },
}
