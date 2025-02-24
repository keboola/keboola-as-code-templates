{
  parameters: {},
  storage: {
    input: {
      tables: [
        {
          source: "in.c-keboola-ex-google-bigquery-v2-" + ConfigId("ga4-raw-events-ua-ga4-comparison-app") + ".event_params",
          destination: "event_params",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
          keep_internal_timestamp_column: false,
        },
        {
          source: "in.c-keboola-ex-google-bigquery-v2-" + ConfigId("ga4-raw-events-ua-ga4-comparison-app") + ".main_table",
          destination: "main_table",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
          keep_internal_timestamp_column: false,
        },
        {
          source: "in.c-keboola-ex-google-bigquery-v2-" + ConfigId("ga4-raw-events-ua-ga4-comparison-app") + ".user_properties",
          destination: "user_properties",
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
      ],
    },
    output: {
      tables: [
        {
          destination: "out.c-comparision-ua-vs-ga4" + InstanceIdShort() + ".COMPARISON",
          source: "COMPARISON3",
        },
      ],
    },
  },
}
