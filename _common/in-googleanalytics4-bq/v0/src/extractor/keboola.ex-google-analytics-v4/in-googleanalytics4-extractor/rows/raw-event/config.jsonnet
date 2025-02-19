{
  parameters: {
    outputTable: "raw_event",
    query: {
      dimensions: [
        {
          name: "date",
        },
        {
          name: "eventName",
        },
        {
          name: "isConversionEvent",
        },
      ],
      metrics: [
        {
          name: "eventCount",
        },
        {
          name: "eventValue",
        },
        {
          name: "totalUsers",
        },
        {
          name: "activeUsers",
        },
        {
          name: "newUsers",
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
