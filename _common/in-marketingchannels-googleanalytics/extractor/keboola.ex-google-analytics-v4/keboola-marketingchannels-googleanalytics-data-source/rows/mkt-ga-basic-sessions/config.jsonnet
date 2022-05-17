{
  parameters: {
    outputTable: "ga-basic-sessions",
    endpoint: "reports",
    query: {
      dateRanges: [
        {
          endDate: Input("ga-to"),
          startDate: Input("ga-from"),
        },
      ],
      metrics: [
        {
          expression: "ga:sessions",
        },
        {
          expression: "ga:pageviews",
        },
        {
          expression: "ga:bounces",
        },
      ],
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
        {
          name: "ga:userType",
        },
        {
          name: "ga:keyword",
        },
        {
          name: "ga:hostname",
        },
        {
          name: "ga:adGroup",
        },
      ],
    },
  },
}
