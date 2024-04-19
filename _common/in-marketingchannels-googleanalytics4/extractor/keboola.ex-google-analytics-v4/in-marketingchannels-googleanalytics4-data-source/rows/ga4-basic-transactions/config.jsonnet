{
  parameters: {
    outputTable: "ga4_basic_transactions",
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
        {
          name: "transactionId",
        },
      ],
      metrics: [
        {
          name: "itemsPurchased",
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
