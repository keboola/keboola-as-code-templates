{
  parameters: {
    query: {
      metrics: [
        {
          name: "sessions",
        },
        {
          name: "totalUsers",
        },
      ],
      dimensions: [
        {
          name: "date",
        },
        {
          name: "source",
        },
        {
          name: "medium",
        },
        {
          name: "campaignName",
        },
        {
          name: "transactionId",
        },
      ],
      dateRanges: [
        {
          startDate: Input("ga-from"),
          endDate: "today",
        },
      ],
    },
    endpoint: "data-api",
    outputTable: "ga4api_t",
  },
}
