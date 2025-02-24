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
          name: "campaignName",
        },
        {
          name: "medium",
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
    outputTable: "ga4api",
  },
}
