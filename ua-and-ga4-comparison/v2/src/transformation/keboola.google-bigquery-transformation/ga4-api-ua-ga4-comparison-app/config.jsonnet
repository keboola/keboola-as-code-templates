{
  parameters: {},
  storage: {
    input: {
      tables: [
        {
          source: "in.c-keboola-ex-google-analytics-v4-" + ConfigId("ga4-data-ua-ga4-comparison-app") + ".ga4api_t",
          destination: "ga4api_t",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
          keep_internal_timestamp_column: false,
        },
        {
          source: "out.c-comparision-ua-vs-ga4" + InstanceIdShort() + ".COMPARISON",
          destination: "COMPARISON",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
          keep_internal_timestamp_column: false,
        },
        {
          source: "in.c-keboola-ex-google-analytics-v4-" + ConfigId("ga4-data-ua-ga4-comparison-app") + ".ga4api",
          destination: "ga4api_without_transactions",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
          keep_internal_timestamp_column: false,
        },
      ],
    },
    output: {
      tables: [
        {
          destination: "out.c-comparision-ua-vs-ga4" + InstanceIdShort() + ".COMPARISON",
          source: "COMPARISON2",
        }
      ],
    },
  },
}
