{
  parameters: {
    outputTable: "ga-basic-transactions",
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
          expression: "ga:itemQuantity",
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
        {
          name: "ga:transactionId",
        },
      ],
    },
  },
}
