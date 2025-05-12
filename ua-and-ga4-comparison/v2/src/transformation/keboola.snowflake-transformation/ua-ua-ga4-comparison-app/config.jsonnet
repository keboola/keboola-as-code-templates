{
  parameters: {},
  storage: {
    input: {
      tables: [
        {
          source: "in.c-keboola-ex-google-analytics-v4-" + ConfigId("ua-data-ua-ga4-comparison-app") + ".Universal-Analytics",
          destination: "Universal-Analytics",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
          keep_internal_timestamp_column: false,
        }
      ],
    },
    output: {
      tables: [
        {
          destination: "out.c-comparision-ua-vs-ga4" + InstanceIdShort() + ".COMPARISON",
          source: "COMPARISON",
        }
      ],
    },
  },
}
