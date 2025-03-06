{
  parameters: {
    query: {
      dimensions: [
        {
          name: "ga:date",
        },
        {
          name: "ga:source",
        },
        {
          name: "ga:medium",
        },
        {
          name: "ga:campaign",
        },
      ],
      dateRanges: [
        {
          startDate: Input("ga-from"),
          endDate: "today",
        },
      ],
      metrics: [
        {
          expression: "ga:users",
        },
        {
          expression: "ga:sessions",
        },
        {
          expression: "ga:transactions",
        },
      ],
    },
    endpoint: "reports",
    outputTable: "Universal-Analytics",
  },
}
