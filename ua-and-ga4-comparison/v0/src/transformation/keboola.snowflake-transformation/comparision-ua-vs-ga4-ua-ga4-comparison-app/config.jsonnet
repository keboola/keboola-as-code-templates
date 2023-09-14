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
          source: "in.c-keboola-ex-google-analytics-v4-" + ConfigId("ua-data-ua-ga4-comparison-app") + ".Universal-Analytics",
          destination: "Universal-Analytics",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
          keep_internal_timestamp_column: false,
        },
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
          destination: "out.c-comparision-ua-vs-ga4" + InstanceIdShort() + ".GA4UA",
          source: "GA4UA",
        },
        {
          destination: "out.c-comparision-ua-vs-ga4" + InstanceIdShort() + ".GA4EXPORT",
          source: "GA4EXPORT",
        },
        {
          destination: "out.c-comparision-ua-vs-ga4" + InstanceIdShort() + ".GA4API",
          source: "GA4API",
        },
        {
          destination: "out.c-comparision-ua-vs-ga4" + InstanceIdShort() + ".UA",
          source: "UA",
        },
        {
          destination: "out.c-comparision-ua-vs-ga4" + InstanceIdShort() + ".COMPARISON",
          source: "COMPARISON",
        },
        {
          destination: "out.c-comparision-ua-vs-ga4" + InstanceIdShort() + ".COMPARISON_DATE",
          source: "COMPARISON_DATE",
        },
      ],
    },
  },
}
