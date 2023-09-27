{
  parameters: {
    outputTable: "raw_ad_analytics",
    query: {
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
